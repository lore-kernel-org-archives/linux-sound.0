From: adam richter <adamrichter4@gmail.com>
Date: Wed, 09 Jul 2014 23:07:46 +0000
Subject: Possible fix for snd-hda-intel model=no-jd failing since ~linux-3.9-rc1
Message-Id: <CAGn-TgjY-DCsygvEQe13Zu_LS9m6Ra44DAccYgFWLaNQrvO8Yw@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="001a1133278ac841e404fdcac6ca"
List-Id: <linux-sound.vger.kernel.org>
To: linux-sound@vger.kernel.org

--001a1133278ac841e404fdcac6ca
Content-Type: text/plain; charset=UTF-8

Hi.

Please feel free to redirect me to another email address.  I did not
notice any contact information for sound/pci/hda in
linux-3.16-rc4/MAINATINERS.

The "model=no-jd" argument has not initialized correctly for me for
linux-3.9-rc1 (if I recall correctly) through linux-3.16-rc4, although
I have not tried every release candidate in between.

The symptom is that, on a computer with an analog audio output jack
that usually does not correctly sense a device is plugged in, audio
output is completely muted until I physically replug the cable, even
though I specified "model=no-jd" as an argument to the snd-hda-intel
kernel module, which is supposed to cause the kernel to ignore the
jack sense reported by hardware and just drive the audio output even
if the hardware jack sense indicates nothing is plugged in.

I have found a few single line workarounds that work, of which my
favorite is the following (also attached to this email, in case any
mailer subjects this message to reformatting), because it does not add
code to anything that gets called frequently.

--- linux-3.16.0-rc4-64bit/sound/pci/hda/hda_jack.c.orig    2014-07-08 15:34
:36.567535340 -0700
+++ linux-3.16.0-rc4-64bit/sound/
pci/hda/hda_jack.c    2014-07-08 15:35:05.1715
34923 -0700
@@ -106,6 +106,7 @@ snd_hda_jack_tbl_new(struct hda_codec *c
    jack->nid = nid;
    jack->jack_dirty = 1;
    jack->tag = codec->jacktbl.used;
+    jack->phantom_jack = codec->no_jack_detect;
    return jack;
}
EXPORT_SYMBOL_GPL(snd_hda_jack_tbl_new);


Signed-off-by: Adam J. Richter <adam_richter2004@yahoo.com>


I consider this a workaround rather than than a perfect fix, because I
think the underlying problem seems to be some kind of initialization
order issue that I don't fully understand.  Basically, by the time
jack->phantom_jack was being set, some caller had already called
jack_detect_update(), which loaded the incorrect jack sense result
from hardware and cleared jack->jack_dirty, so the jack sense would
not be set again.  At least that is what I think the underlying
problem probably is.

Also, if a change like this is to be integrated, I'd like to know if
it might be better for the line that I added to be:

          jack->phantom_jack = !is_jack_detectable(codec, nid);

...which is what add_jack_kctl does (not sure why add_jack_kctls does
not, by the way, at the risk of making a spectacle of my ignorance).
My doubt about this approach is that perhaps is_jack_detectable()
relies on some initialization that has not occurred at that point.

Anyhow, I'd like to get the process started of either pushing this
change upstream or quickly developing a more correct fix.  If a more
correct fix does not become apparent in the next few days, I would
recommend pushing the workaround upstream now until some future code
cleanup, so people will no longer be effected by the bug.

Any technical input or advice on how to proceed is welcome.  Thanks
for taking the time to consider this.

Adam Richter

--001a1133278ac841e404fdcac6ca
Content-Type: text/plain; charset=US-ASCII; name="no-jack-detect.diff"
Content-Disposition: attachment; filename="no-jack-detect.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hxf9aum90

LS0tIGxpbnV4LTMuMTYuMC1yYzQtNjRiaXQvc291bmQvcGNpL2hkYS9oZGFfamFjay5jLm9yaWcJ
MjAxNC0wNy0wOCAxNTozNDozNi41Njc1MzUzNDAgLTA3MDAKKysrIGxpbnV4LTMuMTYuMC1yYzQt
NjRiaXQvc291bmQvcGNpL2hkYS9oZGFfamFjay5jCTIwMTQtMDctMDggMTU6MzU6MDUuMTcxNTM0
OTIzIC0wNzAwCkBAIC0xMDYsNiArMTA2LDcgQEAgc25kX2hkYV9qYWNrX3RibF9uZXcoc3RydWN0
IGhkYV9jb2RlYyAqYwogCWphY2stPm5pZCA9IG5pZDsKIAlqYWNrLT5qYWNrX2RpcnR5ID0gMTsK
IAlqYWNrLT50YWcgPSBjb2RlYy0+amFja3RibC51c2VkOworCWphY2stPnBoYW50b21famFjayA9
IGNvZGVjLT5ub19qYWNrX2RldGVjdDsKIAlyZXR1cm4gamFjazsKIH0KIEVYUE9SVF9TWU1CT0xf
R1BMKHNuZF9oZGFfamFja190YmxfbmV3KTsK
--001a1133278ac841e404fdcac6ca--
