From: adam richter <adamrichter4@gmail.com>
Date: Thu, 11 Sep 2014 03:48:26 +0000
Subject: Re: Possible fix for snd-hda-intel model=no-jd failing since ~linux-3.9-rc1
Message-Id: <CAGn-TgiHr8Ts0wF2jmh575AgK+yfZ=-6MBK+_R1V9RP5k6Xmxg@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="f46d04388df37d9b600502c20a53"
List-Id: <linux-sound.vger.kernel.org>
References: <CAGn-TgjY-DCsygvEQe13Zu_LS9m6Ra44DAccYgFWLaNQrvO8Yw@mail.gmail.com>
In-Reply-To: <CAGn-TgjY-DCsygvEQe13Zu_LS9m6Ra44DAccYgFWLaNQrvO8Yw@mail.gmail.com>
To: linux-sound@vger.kernel.org

--f46d04388df37d9b600502c20a53
Content-Type: text/plain; charset=UTF-8

Hello, Jaroslav and Takashi.

Could you please tell me what I need to do to get this one line change
interegrated so that it will make its way to the mailing kernel?

I apologize if I was unclear in my previous message that I do want to
see this patch integrated now until someone develops a better
solution.

This bug is a regression that began around Linux 3.9-rc1.  I described
it and a one line fix over two months ago on the linux-sound mailing
list.  I have just verified that the bug and the fix are still
applicable to newly released Linux 3.17.0-rc4, and that this change is
not already in git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
or git://git.alsa-project.org/alsa-kernel.git .

For your convenience, I have included an attachment for this one line
patch against linux-3.17.0-rc4, although it is also shown in the text
below.

What do I need to do to get this fix on its way to upstream or get a
rejection with some kind of explanation (for example, maybe a better
fix is already in a git tree and will soon be sent to mainline)?

Thanks in advance for your attention to this, and, of course, thanks
for all of your contributions to Linux.

Adam Richter

On Wed, Jul 9, 2014 at 4:07 PM, adam richter <adamrichter4@gmail.com> wrote:
> Hi.
>
> Please feel free to redirect me to another email address.  I did not
> notice any contact information for sound/pci/hda in
> linux-3.16-rc4/MAINATINERS.
>
> The "model=no-jd" argument has not initialized correctly for me for
> linux-3.9-rc1 (if I recall correctly) through linux-3.16-rc4, although
> I have not tried every release candidate in between.
>
> The symptom is that, on a computer with an analog audio output jack
> that usually does not correctly sense a device is plugged in, audio
> output is completely muted until I physically replug the cable, even
> though I specified "model=no-jd" as an argument to the snd-hda-intel
> kernel module, which is supposed to cause the kernel to ignore the
> jack sense reported by hardware and just drive the audio output even
> if the hardware jack sense indicates nothing is plugged in.
>
> I have found a few single line workarounds that work, of which my
> favorite is the following (also attached to this email, in case any
> mailer subjects this message to reformatting), because it does not add
> code to anything that gets called frequently.
>
> --- linux-3.16.0-rc4-64bit/sound/pci/hda/hda_jack.c.orig    2014-07-08 15:34
> :36.567535340 -0700
> +++ linux-3.16.0-rc4-64bit/sound/
> pci/hda/hda_jack.c    2014-07-08 15:35:05.1715
> 34923 -0700
> @@ -106,6 +106,7 @@ snd_hda_jack_tbl_new(struct hda_codec *c
>     jack->nid = nid;
>     jack->jack_dirty = 1;
>     jack->tag = codec->jacktbl.used;
> +    jack->phantom_jack = codec->no_jack_detect;
>     return jack;
> }
> EXPORT_SYMBOL_GPL(snd_hda_jack_tbl_new);
>
>
> Signed-off-by: Adam J. Richter <adam_richter2004@yahoo.com>
>
>
> I consider this a workaround rather than than a perfect fix, because I
> think the underlying problem seems to be some kind of initialization
> order issue that I don't fully understand.  Basically, by the time
> jack->phantom_jack was being set, some caller had already called
> jack_detect_update(), which loaded the incorrect jack sense result
> from hardware and cleared jack->jack_dirty, so the jack sense would
> not be set again.  At least that is what I think the underlying
> problem probably is.
>
> Also, if a change like this is to be integrated, I'd like to know if
> it might be better for the line that I added to be:
>
>           jack->phantom_jack = !is_jack_detectable(codec, nid);
>
> ...which is what add_jack_kctl does (not sure why add_jack_kctls does
> not, by the way, at the risk of making a spectacle of my ignorance).
> My doubt about this approach is that perhaps is_jack_detectable()
> relies on some initialization that has not occurred at that point.
>
> Anyhow, I'd like to get the process started of either pushing this
> change upstream or quickly developing a more correct fix.  If a more
> correct fix does not become apparent in the next few days, I would
> recommend pushing the workaround upstream now until some future code
> cleanup, so people will no longer be effected by the bug.
>
> Any technical input or advice on how to proceed is welcome.  Thanks
> for taking the time to consider this.
>
> Adam Richter

--f46d04388df37d9b600502c20a53
Content-Type: text/plain; charset=US-ASCII; name="jack.diff"
Content-Disposition: attachment; filename="jack.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hzxjhwen1

LS0tIGxpbnV4LTMuMTcuMC1yYzQtNjRiaXQvc291bmQvcGNpL2hkYS9oZGFfamFjay5jLm9yaWcJ
MjAxNC0wOS0wNyAxNjowOTo0My4wMDAwMDAwMDAgLTA3MDAKKysrIGxpbnV4LTMuMTcuMC1yYzQt
NjRiaXQvc291bmQvcGNpL2hkYS9oZGFfamFjay5jCTIwMTQtMDktMTAgMTg6NDE6NTMuNDIyOTAw
MDQwIC0wNzAwCkBAIC0xMDYsNiArMTA2LDcgQEAgc25kX2hkYV9qYWNrX3RibF9uZXcoc3RydWN0
IGhkYV9jb2RlYyAqYwogCWphY2stPm5pZCA9IG5pZDsKIAlqYWNrLT5qYWNrX2RpcnR5ID0gMTsK
IAlqYWNrLT50YWcgPSBjb2RlYy0+amFja3RibC51c2VkOworCWphY2stPnBoYW50b21famFjayA9
IGNvZGVjLT5ub19qYWNrX2RldGVjdDsKIAlyZXR1cm4gamFjazsKIH0KIEVYUE9SVF9TWU1CT0xf
R1BMKHNuZF9oZGFfamFja190YmxfbmV3KTsK
--f46d04388df37d9b600502c20a53--
