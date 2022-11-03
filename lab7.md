---
title: "Lab 7"
subtitle: "Bipolar Junction Transistors"
author: [Department of Physics | University of Colorado Boulder]
date: '2022-10-31'
caption-justification: centering
toc: true
toc-own-page: true
titlepage: true
header-left: "\\thetitle"
header-center: "Bipolar Junction Transistors"
header-right: "PHYS 3330"
footer-left: "\\thedate"
footer-center: "\\theauthor"
footer-right: "Page \\thepage"
listings-no-page-break: true
code-block-font-size: \scriptsize
---

# Goals

In this lab, you will begin learning how transistors work by creating a dual-stage amplifier out of a common emitter amplifier plus an emitter follower and use this as an audio amplifier.

Proficiency with new equipment:

-   Bipolar junction transistors

Modeling the physical system:

-   Develop a model of bipolar junction transistors

Applications:

-   Build a dual-stage amplifier

-   Use the amplifier to drive a speaker

# Definitions

$\mathbf{h_{fe}}$ **or** $\bm{\beta}$ - transistor current gain intrinsic to the transistor itself.

$\mathbf{V_{E},~V_{B},~V_{C}}$ - voltages at the emitter, base, and collector, respectively. These are the quiescent (DC) voltages.

$\mathbf{v_{in},~v_{out}}$ - input and output voltages; written in lower-case to indicate an AC signal only (not including any DC offset).

**Blocking capacitor** or **coupling capacitor** - capacitors used to transmit an AC signal while blocking the DC component.

# Bipolar Junction Transistors - General Use

An electrical signal can be amplified using a device that allows a small current or voltage to control the flow of a much larger current from a DC power source. Transistors are the basic devices providing control of this kind. There are two general types of transistors, bipolar and field-effect. The difference between these two types is that for bipolar devices an input current controls the large current flow through the device, while for field-effect transistors an input voltage provides the current control. In this experiment we will build a two-stage amplifier using two bipolar transistors.

In many practical applications it is better to use an op-amp as a source of gain rather than to build an amplifier from discrete transistors. A good understanding of transistor fundamentals is nevertheless essential because op-amps are built from transistors. We will learn later about digital circuits, which are also made from transistors. In addition to the importance of transistors as components of op-amps, digital circuits, and an enormous variety of other integrated circuits, single transistors (usually called "discrete" transistors) are used in many applications. They are important as interface devices between integrated circuits and sensors, indicators, and other devices used to communicate with the outside world. High-performance amplifiers operating from DC through microwave frequencies use discrete transistor "front-ends" to achieve the lowest possible noise. Discrete transistors are generally much faster than op-amps. The device we will use this week has a gain-bandwidth product of 300 MHz (compared to 5 MHz for the LF356 op-amp you have been using).

The three terminals of a bipolar transistor are called the emitter, base, and collector (Figure [1](#NPN){reference-type="ref" reference="NPN"}). A small current into the base controls a large current flow from the collector to the emitter. The current at the base is typically about 1% of the collector-emitter current. This means that the transistor acts as a current amplifier with a typical current gain ($h_{fe}$ or $\beta$) of about 100. Moreover, the large collector current flow is almost independent of the voltage across the transistor from collector to emitter. This makes it possible to obtain a large amplification of voltage by having the collector current flow through a resistor.

![Diagram of an NPN bipolar junction transistor (left) and schematic symbol (right)](tmp.png){#NPN}

# Current Amplifier Model of a Bipolar Transistor

From the simplest point of view a bipolar transistor is a current amplifier. The current flowing from collector to emitter is equal to the base current multiplied by a factor. An NPN transistor like the 2N3904 operates with the collector voltage at least a few tenths of a volt above the emitter, and with a current flowing into the base. There are also PNP transistors with opposite polarity voltages and currents. The base-emitter junction acts like a forward-biased diode with a 0.6 V drop:

$$V_E \approx V_B-0.6~V$$

Under these conditions, the collector current is proportional to the base current:

$$I_C = h_{fe}I_B$$

The constant of proportionality ('current gain') is called $h_{fe}$ because it is one of the \"h-parameters\", which are a set of numbers that give a complete description of the small-signal properties of a transistor. It is important to keep in mind that hfe is not really a constant. It depends on collector current, and it can vary by 50% or more from device to device.

If you want to know the emitter current, rather than the collector current, you can find it by current conservation:

$$I_E = I_B+I_C = I_C\left(\frac{1}{h_{fe}+1}\right)$$

The difference between $I_C$ and $I_E$ is almost never important since $h_{fe}$ is normally in the range of 100--1000, so you can generally assume that $I_E$ = $I_C$. Another way to say this is that the base current is very small compared to the collector and emitter currents.

# Emitter Follower and Common Emitter Amplifier

::: circuitikz
(0,0) node\[npn\](Q); (Q.B) to \[short, -o\] ++(-1,0) node\[anchor = east\]$V_{in}$; (Q.E) to \[R, l=$R_E$\] ++(0,-2) node\[ground\]; (Q.E) to \[short,\*-o\] ++(1.5,0) node\[anchor = west\]$V_{out}$; (Q.C) to \[short, -o\] ++(0,2) node\[anchor = south\]$+15~V$;
:::

::: circuitikz
(0,0) node\[npn\](Q); (Q.B) to \[short, -o\] ++(-1,0) node\[anchor = east\]$V_{in}$; (Q.E) to \[R, l=$R_E$\] ++(0,-2) node\[ground\]; (Q.C) to \[short,\*-o\] ++(1.5,0) node\[anchor = west\]$V_{out}$; (Q.C) to \[R, l=$R_C$\] ++(0,2) to \[short, -o\] ++(0,0) node\[anchor = south\]$+15~V$;
:::

We will begin by constructing a common emitter amplifier, which operates on the principle of a current amplifier. However, a major fault of the common emitter amplifier is its high output impedance. This problem can be fixed by adding a second circuit, the emitter follower, as a second stage. The common-emitter amplifier and the emitter follower are the most common bipolar transistor circuits.

First consider the emitter follower (Figure [\[emitterf\]](#emitterf){reference-type="ref" reference="emitterf"}). The output (emitter) voltage is always 0.6 V (one diode drop) below the input (base) voltage. A small AC signal of amplitude $v_{in}$ at the input will therefore give a signal $v_{in}$ at the output, i.e. the output just "follows" the input. There is no gain (the gain is 1) but we will see later that this circuit is still useful because it has high input impedance and low output impedance.

Now consider the common emitter amplifier (Figure [\[emittera\]](#emittera){reference-type="ref" reference="emittera"}). A small AC signal of amplitude $v_{in}$ at the input will give the same AC signal $v_{in}$ at the emitter (just like the emitter follower). This will cause a varying current of amplitude $v_{in}/R_E$ to flow from the emitter to ground. As we found above, $I_E\gg I_C$, and so the same current will flow through $R_C$. This current generates $v_{out} = –R_C(v_{in}/R_E)$. Thus, the common emitter stage has a small-signal AC voltage gain of:

$$G=\frac{-R_C}{R_E}$$

**Note:** this gain is about the change in voltage, which is a bit different than the gains you have been working with so far.

# Biasing a Transistor Amplifier

Figure [\[emittera2\]](#emittera2){reference-type="ref" reference="emittera2"} shows the basic common emitter amplifier, while Figure [\[emitterabn\]](#emitterabn){reference-type="ref" reference="emitterabn"} shows the common emitter amplifier circuit that you will build with the biasing resistors, power filter capacitor, and coupling capacitors in place. The power filter capacitor connecting +15 V to ground serves to ensure that electronic noise from the power supply does not enter the circuit. The coupling capacitors on the input and output serve to transmit the AC signal and block the DC voltage. For the input, this is essential because if you feed DC voltage into something providing its own voltage, bad things will happen. In this case, if the biasing DC voltage is directly connected to the output of the function generator ($v_{in}$) the output buffer in the function generator will break. For the output, the coupling capacitor is simply convenient as we don't care about the DC voltages, just the AC signal.

::: circuitikz
(0,0) node\[npn\](Q); (Q.B) to \[short, -o\] ++(-1,0) node\[anchor = east\]$V_{in}$; (Q.E) to \[R, l=$R_E$\] ++(0,-2) node\[ground\]; (Q.C) to \[short,\*-o\] ++(1.5,0) node\[anchor = west\]$V_{out}$; (Q.C) to \[R, l=$R_C$\] ++(0,2) to \[short, -o\] ++(0,0) node\[anchor = south\]$+15~V$;
:::

::: circuitikz
(0,0) node\[npn\](Q)2N3904; (Q.B) -- ++(-2,0) to \[C, l2=$C_{in}$ and 220 nF, l2 halign=c\] ++(-1,0) to \[short, -o\] ++(-1,0) node\[anchor = east\]$V_{in}$; (Q.E) to \[R, l2=$R_E$ and 1 k$\Omega$\] ++(0,-3) to ++(-1,0) node\[ground\] to ++(-1,0) to \[R, l2=$R_2$ and 10 k$\Omega$, l2 halign=c\] ++(0,3.77) to \[short, \*-\] ++(0,1.25) to \[R, l2=$R_1$ and 47 k$\Omega$, l2 halign=c\] ++(0,2) to \[short, -\*\] ++(0,.52); (Q.C) to \[short,\*-\] ++(1.5,0) to \[C, l2\_=$C_{out}$ and 47 $\mu$F, l2 halign=c\] ++(1,0) to \[short,-o\] ++(1,0) node\[anchor = west\]$V_{out}$; (Q.C) to \[R, l2\_=$R_C$ and 2.74 k$\Omega$, l2 halign=c\] ++(0,3) coordinate(FT) to \[short, \*-o\] ++(1,0) node\[anchor = west\]$+15~V$ (FT) to ++(-3,0) to \[C, l2=$C$ and 47 $\mu$F, l2 halign=c\] ++(-2,0) node\[ground\];
:::

This brings us to the biasing network. While we are usually trying to amplify a small AC signal, it is essential that we setup the proper "quiescent point" or bias voltages. These are the DC voltages present when the signal is zero. Setting up the proper biasing often requires an iterative process. Here are the steps to understand what is happening in a transistor setup.

1.  Set the DC voltage of the base, $V_B$, with a voltage divider ($R_1$ and $R_2$ in Figure [\[emitterabn\]](#emitterabn){reference-type="ref" reference="emitterabn"}).

2.  The emitter voltage, $V_E$, will be 0.6 V less than the base voltage.

3.  Between the emitter and ground, there is one resistor so we can determine the current flowing through that resistor, which is the same as the current flowing out of the emitter: $I_E = V_E/R_E$.

4.  Recall that the emitter and collector current are approximately equal so $I_C = I_E$.

5.  Using this current, we can calculate voltage drop across the collector resistor and subtract that from the power supply voltage, $V_{PS}$ = +15 V, to get the collector voltage: $V_C = V_{PS}~ –~ I_CR_C$.

6.  If we have capacitors or inductors in parallel with (or in place of) the resistors $R_C$ and $R_E$, then we would use the AC impedances.

For an emitter follower, the biasing is about the same except that the collector is usually tied to the positive supply voltage so $V_C = V_{PS}$.

Determining the best values to use for the resistors and capacitors depends on what the circuit needs to do.

# Output Range of the Common Emitter Amplifier (Clipping Voltages)

Even with proper biasing of the transistor, the output voltage has a range that is less than 0-15 V. Let's determine the maximum and minimum output voltages. Since $V_{out} = V_{PS}~ –~ I_CR_C$, the maximum voltage will occur when $I_C = 0$ and the minimum voltage when $I_C$ is a maximum.

**Maximum voltage:** This occurs when the transistor is turned off and no current is flowing. As there is no current flowing through $R_C$, there is no voltage drop across it. Thus $V_{out} = V_{max} = V_{PS} = 15 ~V$.

**Minimum Voltage:** This occurs when the transistor is fully on. The maximum current is flowing and there is very little voltage drop across the transistor. The voltage is:

$$V_{out} = V_{min} = V_{PS} ~– ~R_C I_C~ (max)$$

$I_C~(max)$ can be found by considering the voltage drop from the power supply to ground when there is no voltage drop across the transistor: $V_{PS}~-~R_C I_C ~-~ R_E I_E = 0$.

# Input and Output Impedances of the Common Emitter Amplifier

The input impedance is the same for both the emitter follower and the common emitter amplifier. The input impedance looking into the base of the common emitter amplifier is

$$r_{in} = R_E h_{fe}$$

where $R_E$ is whatever impedance is connected to the emitter. If there is no load attached, it is just the emitter resistor. However, if there is a load attached, $R_E$ will be the emitter resistor in parallel with the input impedance of the load (or the next stage). This input impedance is for the base of the transistor. If there is a biasing network in place, then the input impedance of the *circuit* will be $r_{in}$ in parallel with the base bias resistors.

The output impedance of the common emitter amplifier (Figure 2b) is just equal to the collector resistor $R_C$:

$$r_{out} = R_C ~~\text{(common emitter)}$$

The output impedance of the emitter follower is found to be:

$$r_{out} = \frac{R_B}{h_{fe} +1}~~ \text{(emitter follower)}$$

where $R_B$ indicates whatever impedance is connected to the base. To be more precise, one should also include the emitter resistor in parallel with rout for the true output impedance of the circuit, but this is usually not necessary as rout is usually much smaller than $R_E$. Also, please note the next section gives a more precise estimate of $r_{out}$.

# Ebers-Moll Model of a Bipolar Transistor

Instead of using the current amplifier model, one can take the view that the collector current $I_C$ is controlled by the base-emitter voltage $V_{BE}$. For our purposes, the Ebers-Moll model modifies our current amplifier model of the transistor in only one important way. For small variations about the quiescent point, the transistor now acts as if it has a small internal resistor, $r_e$, in series with the emitter. The magnitude of the intrinsic emitter resistance, $r_e$, depends on the collector current $I_C$:

$$r_e = 25~\Omega \left(\frac{1~mA}{I_C}\right)$$

The presence of the intrinsic emitter resistance, $r_e$, modifies the above input and output impedances to:

$$r_{in} = (R_e + r_e)~h_{fe}~~ \text{(common emitter amplifier \textit{and} emitter follower)}$$

$$r_{out} = \frac{R_B}{h_{fe}+1}+r_e~~ \text{(emitter follower)}$$

In addition, this modifies the gain of the common emitter amplifier to:

$$G = \frac{-R_C}{R_E+r_e}$$

which shows that the common emitter gain is not infinite when the external emitter resistor goes to zero.

# Useful Readings

# Prelab

# Common Emitter Amplifier

# Dual Stage Amplifier

# Summary and Conclusions

Write a two-paragraph summary in your lab notebook of what you learned and any important takeaways.

# Appendix A: Title {#appendix-a-title .unnumbered}
