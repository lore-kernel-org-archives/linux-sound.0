From: Peter Enderborg <pme@ufh.se>
Date: Sat, 18 Sep 1999 21:26:30 +0000
Subject: Re: Bad MIDI performance : 10ms latency instead of the expected 1-1.5ms
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------52110DE307AC24DA8B8975E2"
Message-Id: <marc-linux-sound-93769055420997@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93568883025986@msgid-missing>
In-Reply-To: <marc-linux-sound-93568883025986@msgid-missing>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------52110DE307AC24DA8B8975E2
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Benno Senoner wrote:

> On Thu, 26 Aug 1999, Jaroslav Kysela wrote:
>
> > > I wrote this to measure the MIDI output-to-input delay.
> > > I tried both with blocking I/O and non-blocking I/O.
> > > Unfortunately I get bad values in both modes:
> > > about 11.5ms , and this is exactly the MIDI transfer time (1.3ms) plus
> > > 10ms = 1 jiffie.
> > > If I run the test on a HZ=1000 kernel I get about 2ms.
> >
> > MPU401 is very bad hardware for transmit, because it doesn't use interrupt
> > to determine that Tx FIFO is free. Some vendors offers large FIFOs
> > (8,12,16 bytes), but unfortunately guys at Creative designed SB AWE with
> > 2 byte FIFO.
>
> Hmm .. so you are saying that this is a HARDWARE limitiation ?
> How does Windoze manage this ?
>
> >
> > This doesn't explain why your latencies are so big for OSS/Free, because
> > OSS/Free code uses polling mode (busy loop for transmit).
>
> What is the main drawback of this ?
> What happens when I send a block of 3000 bytes to the midi device under
> OSS/Free ?
> A 100% CPU usage for 1sec ?
> I can't believe this.
>
> >
> > ALSA uses system timer to avoid busy loop, but the performance depends on
> > your HZ value:
> >
> > 100Hz, 2 byte FIFO = 200bytes/sec
> > 100Hz, 8 byte FIFO = 1600bytes/sec
> > 100Hz, 12 byte FIFO = 2400bytes/sec
> > 100Hz, 16 byte FIFO = 3200bytes/sec
>
> 200bytes/sec is just rudiculous , how do you plan to drive an external synth
> with that little MIDI bandwidth ?
> Many songs uses up much of the 3000 bytes/sec bandwidth, especially
> when there are many  controller/pitchbend events present.
>
> Do you know if the RX FIFO of the MPU401 has the same problem (no interrupt) or
> is there an interrupt present ?
>
> Is there no other way to make the MIDI response better, without increasing HZ
> to 1000 ?
>
> Does this mean that sequencers running under Windows have the same problems
> as we in Linux on the AWE64 ?
> Or does Windows a "sane" busywaiting all the time ?  :-)
> With these big midi delays you can't simply use your PC to act as a midi-tru
> box, playing an external synth via masterkeyboard connected to the midi-in.
>
> >
> > Not affected hardware:
> >
> >       GUS soundcards
> >       AudioPCI chips (ES1370/1371/1373)
>
> If this is true, then I will throw away my AWE64 and buy an AudioPCI
> :-)
>
> regards,
> Benno.
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.rutgers.edu
> Please read the FAQ at http://www.tux.org/lkml/

Im the only one that have problems with perfomance while receiving midi data ?
It is droping a lot of events. Oss don't drop so mush, but alsa is useless. Is it
SMP problem ? Low irq responce times ? I have a SB PCI 128 and a hoontech
and have the same problem with both. (The hoontech is only avalible with alsa
driver)


--
foo!



--------------52110DE307AC24DA8B8975E2
Content-Type: text/x-vcard; charset=us-ascii;
 name="pme.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Peter Enderborg
Content-Disposition: attachment;
 filename="pme.vcf"

begin:vcard 
n:Enderborg;Peter
x-mozilla-html:FALSE
org:;
adr:;;;;;;
version:2.1
email;internet:pme@ufh.se
x-mozilla-cpt:;0
fn:Peter Enderborg
end:vcard

--------------52110DE307AC24DA8B8975E2--
