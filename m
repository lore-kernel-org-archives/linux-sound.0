Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.68.251
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694492;
	b=nJUrEuQA8EgS+a0ptW4WyOePHA3LnEBMwDKMdUtqrvBeYjBpeXsXhry7bCcMun2l+FFd
	 Gm+kvSWAdvhr2ru1gVkqrVKabib6oH51cdpKBd0QQWZMWiPPa+V+zaHV3jattT7se9Wuj
	 IQuaZbuhXVrJxahIxLq6giDNhcdEM+8Ub3sXCdnhCCXaiwyNEV1vhj5UasPLbYt2szp3Y
	 7rXgXfcSsNnisf4u9hPbfOwF/TISn+RDeKWTClSMhQpChMJFKRSdll3cPbGDk29+kRVbj
	 LBttH67F2xdKMxlbNuUjhpiB3BQBgDAeldSJhdnJHrVpbAAn0Lqh2wRbEmm+UB7OQOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694492;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:Content-Type:
	 Content-Transfer-Encoding:From:Mime-Version:Subject:Message-Id:Date:
	 To:Cc:X-Mailer:X-Proofpoint-GUID:X-Authority-Info-Out:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=2FWvsYPr8hyqYnRtxFQ0p6mzbHF/aWf8fOYdti/L/mU=;
	b=v796WXsQcDuFVpy/6r9ZRZDsP5KCg3cDjdEnrhdogheuykPddlNK6flbuV2qZXi8NBee
	 C/6lquYHlAwIwyxyxofDMLWT5YQJ4PNjfBPDXHXYhdAx5GZk/81Nm15lLGw61ct4A9BvZ
	 d4ChPWygN3oFOUIq8FQGB3qRcx9jFsHCcT7d77LzuVBvHW5mQpuImFUFLRqA6MVeMm6lX
	 nS/gE0BUcmTixgaHvA6NprNPoGIsUlvChguoxDUhw1o8U2GGD75MqXXgFnIA/m4fP7Tz6
	 htn8RNOKISCWohbGh5vpqat76L7A00eyxR4PP9I5uxIS5JmIcRP67DYS+ylOSG9FmNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tarasov.top;
	spf=pass smtp.mailfrom=tarasov.top;
	dkim=pass header.d=tarasov.top header.i=@tarasov.top header.a=rsa-sha256 header.s=sig1 header.b=artn5JQu;
	arc=none smtp.remote-ip=57.103.68.251
Received: from outbound.mr.icloud.com (mr-2002g-snip4-8.eps.apple.com [57.103.68.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF7606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 12:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABAF7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tarasov.top
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tarasov.top
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tarasov.top header.i=@tarasov.top header.a=rsa-sha256 header.s=sig1 header.b=artn5JQu
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPS id 6306E1809895;
	Thu, 26 Nov 2026 12:01:30 +0000 (UTC)
X-ICL-RepId: 01a217bb-7274-765f-82f2-a9ff6f4e8cae
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tarasov.top; s=sig1; t=1795694491; x=1827230491; bh=2FWvsYPr8hyqYnRtxFQ0p6mzbHF/aWf8fOYdti/L/mU=; h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=artn5JQu/kD3sJMbBklGQRZsaCPEORIpuV1rp7CqIkuhplGduWthBFjkU7617oKCNRNUdfr1/3InaEegG9XbwXlGwjmELDaQ3drpnnwdo9U/WgcDfb2okxLdKu4wAqJC75p13gDNdABbw2F48LRi27TsI34Um0r0SaDowU799hml4vOWd6VmDviRYFtcMKyXBKYMNmaXS0R1G05Qi6NkJszGQu0E+JOp8QtsND4QP+WgxiReaueDKAX70DNbBXg6p6f3N6lspmFGFqLqB0O7klD6ZrdMBwfnxlI0VF/Z6Njz8LHRessIolDLTTaNNovnjFxyY0GyC1Dff2ki+fE8Ww==
mail-alias-created-date: 1779190196810
Received: from smtpclient.apple (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPSA id BAF8B180015B;
	Thu, 26 Nov 2026 12:01:29 +0000 (UTC)
Content-Type: multipart/mixed; boundary=Apple-Mail-11CA9384-6EA2-4A28-A0EE-EC1DC28A4C11
Content-Transfer-Encoding: 7bit
From: =?utf-8?B?0J3QuNC60LjRgtCwINCi0LDRgNCw0YHQvtCy?= <nik@tarasov.top>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: [PATCH] ALSA: usb-audio: Initialize Audient iD14 MkII monitor mix at unity gain
Message-Id: <781FF3DB-B352-4B18-A42D-40AAB3A46C51@tarasov.top>
Date: Thu, 26 Nov 2026 17:01:17 +0500
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, mrwillporter@gmail.com, arc@gmx.li, drabik.p@gmail.com
X-Mailer: iPhone Mail (24B156)
X-Proofpoint-GUID: nvI_6GTzKIjPqq40p1u_H5939ZQnVxUJ
X-Authority-Info-Out: v=2.4 cv=HbuB3SE8 c=1 sm=1 tr=0 ts=6b081f9a
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=4Xuvw5ty44FKcjjuTMQI:22 a=QOASFx3vMJ8LQt1gGM8n:22 a=ZDWhmJ7kXn3eYBMlWsQA:9
 a=CjuIK1q_8ugA:10 a=rnqpEyKOaAS2KvKcS1kA:9 a=tclcd6dtLQvEqt9_mmAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX3KWi8+eSd3Db
 zjXxAJhnqZ3mx8d8YX7nWrUQj+srtIFbsrg/aCF5We6X+v0gVWof8lA1uorz3yD3XfJ3L5X1hM8
 4nwt6eSfJv9SPiOoqa2k6kR9L36Jl2h47cIcFn/Dz58XItS2vnGwfSg7bj3JhgS8wiUA3URkPUv
 JesD9G7i5w8AiRP8OIwVpdQtWNZwPF6H4pdMDxXsztSwFBz73Oxp7QpDBs7q85EQiuPUapbHsJr
 e/UTQm+iC9Wjvso57+d7/kERc/gLo9yp/cd4Gkl2o02fseYZXLmZ6cXv86kdzhsAng8ARtvRLFD
 9m7RMB5R0hkUMBB1t2B+sDOusbG0DYZ1tR3OSnZ+AdmGeiGWSdT3U0Kq3YxdLw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX27Kyit1/yQz4
 +EWpJTHHB76pcdtQXpedFPZCLkgwHPI518wW8fEprPYcYyGGZon6yV+oFZ7gPz8WWeUwpGHAl31
 fV5EE17foyuSUEz8NoVRlu4fZjB+frE=
X-Proofpoint-ORIG-GUID: nvI_6GTzKIjPqq40p1u_H5939ZQnVxUJ
X-JNJ: AAAAAAABbwE7RQEnINnwhT4BZNRBILOCYiudi+uXEPHsUEEDqqQLBaxLPqBfQyvK0wfKvG
 ta6IH4GGUkKKyeq4f0tvofaz6uBuhyF3jufmL90dVIhoAUE+1FQRsAHWszcJcyqZJNhMvU
 3PfnoeTQbDH/KxlzItdYpEbicEmHzHzOuz1TQRYnbje0ttlrr0AO0R1Z9wPCCuHzL8kUKp
 Y0zMjeeX2pCAnCCk3Ezwsgj62b+So6RyodQSGLmm2IjzJCn9dvFRcLCaQIATd4kTDt6s/Y
 rdMZEHNQCYatqbgp9a2nXVY43WkK0cXJz0V97bbnSp+4FvXzB6xiSJwb8K08VgcNApvOov
 6wStPGRAaB5I6gTTV3zj40h4TW67YN5TTYiDxe0Z2oxt/DIr4zZqbnwZM3vBL5xhuzJ8fs
 BGv4h/A4BdqPO/sY8XS9mnsdp6e78/Ss9+tJNQC+gUnONuKTG4uAYNzjYWNiuMLSICOcwY
 HVprDaYbKT7kyjAVxaA0AB2hYQ1zSmkGJFDpJc5cNgI02l5eR2CE3OgH1wN/5OW1uCJ4nD
 Wzvq1n8hXIYVq/QbWBanGKIIwEaqChjjTEdkApckG50f4Bnnvqa5B5O/Iv4UAuQPVxAx6a
 fN2/pAu8V8CXGX/Be2EI+rTKLuPZjEv5zSBjPT7sYbCHouPe166QlKZXDZ+l6W0vRXD+VX
 eyNOdlMHUuomDdxErp6gMJM+fKLsPEuMrB9h8EXH5ndJhUIdHc9o6Et1+VaMU42DeHeRQO
 h33UdzGrdgxLSCoSErfbykHpLBylK6pp2NzP18yQ7aZSOAGUTRZvF5k1MSsRxwMcSDZJ0l
 kn3BaFw63O33e+FodlvzNY2EWepvPDRtUHQ8YqY8xqsAPMIhjbqSm2/LCP6Joun7B+c9hn
 pZ3F2ol9hl4KrXU+o/cKgUTBjZ0S9PIY/77Qu0evVMEcBifyHg+W8KbXWYKMNj8lA/5hDp
 Duf18lYkjYC9AOBjy+u4HTavP+UYtaUTnTKv6n8jJxtTpvoP9UfvoY6NEL41ffo+uaGaYg
 l3QZRJM5w3kUlUoxqXyFjemyuSow/rWol9FpB4GwpOXcfCxlNocC8crAEKT8SxCr78PIKe
 B1Yu6obwySFe5HtCc/FOh1t5t3WguisEzJsvCa4aOKMewIfVU4AGdQMIIBxvtbtYQEvEWh
 ix/bDsILfCFXgH9M3nPc8495dlnxtQJga/jR+Oi33In5KbV0xt7/71KQphgBpbUWxQeHeM
 JSOIMGQvVcFsco+ItE4669Ip75xb/l/6dTxPvmGyRhZ1AQtTgIre3m7nEOxFMfkUnbXVrw
 PHqjsPqaFrmqPs3JiEejNDaomAMlqzN0hqgfrTaHx0zv+zZA64tYX7mxCuK1Bh2LV3DjeE
 1M6Wd3qZJWcdqZ11XiKe3DP9zmf4YUWUMBo5ZASp4EXT7azp0NXhM2s=


--Apple-Mail-11CA9384-6EA2-4A28-A0EE-EC1DC28A4C11
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The Audient iD14 MkII (2708:0008) feeds its main monitor outputs from a
four-channel volume feature unit (FU 12).  The unit's attenuation is
asymmetric in the device firmware: the left main channel ignores its
volume value while the right main channel applies it, so any value
below 0 dB unbalances the main stereo pair.  Commit 9c0564fcc21a
("ALSA: usb-audio: Rename the Audient iD14 monitor mix volume
control") renamed the control so that userspace does not adopt it as a
master volume, but nothing brings the unit to a known-good state.

In addition, the firmware silently drops volume SET_CUR requests that
arrive while the driver is probing the device after a USB reset: the
request is ACKed but ignored, and a GET_CUR issued immediately
afterwards echoes the last payload instead of the actual state (the
same shared-response-buffer behaviour reported for the iD14 MkI in the
"ALSA: usb-audio: Audient iD14 MkI vendor controls" RFC series).
Writes issued after probe has settled are applied reliably.

Schedule a delayed work that writes 0 dB to all four channels of FU 12
three seconds after the mixer is created, mirroring the startup state
of the Audient desktop application, and cancel it on disconnect via
private_free.

Tested on linux 7.3.6 with an iD14 MkII: with FU 12 left at -25 dB,
reconnecting the device now restores unity gain automatically.

Signed-off-by: Nikita Tarasov <nik@tarasov.top>
---
 sound/usb/mixer_quirks.c | 65 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 01210cc..2672f6f 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4419,6 +4419,67 @@ static int snd_djm_controls_create(struct usb_mixer_i=
nterface *mixer,
 	return 0;
 }
=20
+struct audient_mix_init {
+	struct usb_mixer_interface *mixer;
+	struct delayed_work work;
+};
+
+static void audient_monitor_mix_work(struct work_struct *work)
+{
+	struct audient_mix_init *d =3D
+		container_of(work, struct audient_mix_init, work.work);
+	struct snd_usb_audio *chip =3D d->mixer->chip;
+	/* 0 dB on all four channels (main L/R, cue L/R) */
+	const u8 target[2] =3D { 0x00, 0x00 };
+	u8 ch;
+
+	for (ch =3D 1; ch <=3D 4; ch++)
+		snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
+			UAC_SET_CUR,
+			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,=

+			(UAC_FU_VOLUME << 8) | ch,
+			snd_usb_ctrl_intf(d->mixer->hostif) | (12 << 8),
+			(void *)target, sizeof(target));
+}
+
+static void audient_monitor_mix_free(struct usb_mixer_interface *mixer)
+{
+	struct audient_mix_init *d =3D mixer->private_data;
+
+	cancel_delayed_work_sync(&d->work);
+	kfree(d);
+	mixer->private_data =3D NULL;
+	mixer->private_free =3D NULL;
+}
+
+/*
+ * The Audient iD14 MkII main monitor outputs are fed by a four-channel
+ * volume feature unit (FU 12) whose attenuation is asymmetric in the
+ * firmware: the left main channel ignores its volume value while the
+ * right one applies it, so any value below 0 dB unbalances the stereo
+ * pair.  Ensure the unit starts at unity gain, like the Audient desktop
+ * application does.
+ *
+ * The firmware silently drops volume writes that arrive while the
+ * driver is still probing the device after a USB reset (the request is
+ * ACKed but ignored), so apply them from a delayed work once probe has
+ * settled.
+ */
+static int audient_monitor_mix_init(struct usb_mixer_interface *mixer)
+{
+	struct audient_mix_init *d;
+
+	d =3D kzalloc_obj(*d);
+	if (!d)
+		return -ENOMEM;
+	d->mixer =3D mixer;
+	INIT_DELAYED_WORK(&d->work, audient_monitor_mix_work);
+	queue_delayed_work(system_percpu_wq, &d->work, msecs_to_jiffies(300=
0));
+	mixer->private_data =3D d;
+	mixer->private_free =3D audient_monitor_mix_free;
+	return 0;
+}
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err =3D 0;
@@ -4557,6 +4618,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer=
_interface *mixer)
 		err =3D dell_dock_mixer_create(mixer);
 		break;
=20
+	case USB_ID(0x2708, 0x0008): /* Audient iD14 MkII */
+		err =3D audient_monitor_mix_init(mixer);
+		break;
+
 	case USB_ID(0x2a39, 0x3fd2): /* RME ADI-2 Pro */
 	case USB_ID(0x2a39, 0x3fd3): /* RME ADI-2 DAC */
 	case USB_ID(0x2a39, 0x3fd4): /* RME */
--=20
2.56.1=

--Apple-Mail-11CA9384-6EA2-4A28-A0EE-EC1DC28A4C11
Content-Type: application/octet-stream;
	name=audient-id14-mkii-unity.patch;
	x-apple-part-url=4A8820A6-8487-428E-8B33-9F3E246F0D9C
Content-Disposition: attachment;
	filename=audient-id14-mkii-unity.patch
Content-Transfer-Encoding: quoted-printable

=46rom b3823b4b23f4034b6b435b1a7d584be81946273d=20Mon=20Sep=2017=2000:00:00=20=
2001=0AFrom:=20Nikita=20Tarasov=20<nik@tarasov.top>=0ADate:=20Thu,=2026=20No=
v=202026=2016:14:56=20+0500=0ASubject:=20[PATCH]=20ALSA:=20usb-audio:=20Init=
ialize=20Audient=20iD14=20MkII=20monitor=20mix=20at=0A=20unity=20gain=0A=0AT=
he=20Audient=20iD14=20MkII=20(2708:0008)=20feeds=20its=20main=20monitor=20ou=
tputs=20from=20a=0Afour-channel=20volume=20feature=20unit=20(FU=2012).=20=20=
The=20unit's=20attenuation=20is=0Aasymmetric=20in=20the=20device=20firmware:=
=20the=20left=20main=20channel=20ignores=20its=0Avolume=20value=20while=20th=
e=20right=20main=20channel=20applies=20it,=20so=20any=20value=0Abelow=200=20=
dB=20unbalances=20the=20main=20stereo=20pair.=20=20Commit=209c0564fcc21a=0A(=
"ALSA:=20usb-audio:=20Rename=20the=20Audient=20iD14=20monitor=20mix=20volume=
=0Acontrol")=20renamed=20the=20control=20so=20that=20userspace=20does=20not=20=
adopt=20it=20as=20a=0Amaster=20volume,=20but=20nothing=20brings=20the=20unit=
=20to=20a=20known-good=20state.=0A=0AIn=20addition,=20the=20firmware=20silen=
tly=20drops=20volume=20SET_CUR=20requests=20that=0Aarrive=20while=20the=20dr=
iver=20is=20probing=20the=20device=20after=20a=20USB=20reset:=20the=0Areques=
t=20is=20ACKed=20but=20ignored,=20and=20a=20GET_CUR=20issued=20immediately=0A=
afterwards=20echoes=20the=20last=20payload=20instead=20of=20the=20actual=20s=
tate=20(the=0Asame=20shared-response-buffer=20behaviour=20reported=20for=20t=
he=20iD14=20MkI=20in=20the=0A"ALSA:=20usb-audio:=20Audient=20iD14=20MkI=20ve=
ndor=20controls"=20RFC=20series).=0AWrites=20issued=20after=20probe=20has=20=
settled=20are=20applied=20reliably.=0A=0ASchedule=20a=20delayed=20work=20tha=
t=20writes=200=20dB=20to=20all=20four=20channels=20of=20FU=2012=0Athree=20se=
conds=20after=20the=20mixer=20is=20created,=20mirroring=20the=20startup=20st=
ate=0Aof=20the=20Audient=20desktop=20application,=20and=20cancel=20it=20on=20=
disconnect=20via=0Aprivate_free.=0A=0ATested=20on=20linux=207.3.6=20with=20a=
n=20iD14=20MkII:=20with=20FU=2012=20left=20at=20-25=20dB,=0Areconnecting=20t=
he=20device=20now=20restores=20unity=20gain=20automatically.=0A=0ASigned-off=
-by:=20Nikita=20Tarasov=20<nik@tarasov.top>=0A---=0A=20sound/usb/mixer_quirk=
s.c=20|=2065=20++++++++++++++++++++++++++++++++++++++++=0A=201=20file=20chan=
ged,=2065=20insertions(+)=0A=0Adiff=20--git=20a/sound/usb/mixer_quirks.c=20b=
/sound/usb/mixer_quirks.c=0Aindex=2001210cc..2672f6f=20100644=0A---=20a/soun=
d/usb/mixer_quirks.c=0A+++=20b/sound/usb/mixer_quirks.c=0A@@=20-4419,6=20+44=
19,67=20@@=20static=20int=20snd_djm_controls_create(struct=20usb_mixer_inter=
face=20*mixer,=0A=20=09return=200;=0A=20}=0A=20=0A+struct=20audient_mix_init=
=20{=0A+=09struct=20usb_mixer_interface=20*mixer;=0A+=09struct=20delayed_wor=
k=20work;=0A+};=0A+=0A+static=20void=20audient_monitor_mix_work(struct=20wor=
k_struct=20*work)=0A+{=0A+=09struct=20audient_mix_init=20*d=20=3D=0A+=09=09c=
ontainer_of(work,=20struct=20audient_mix_init,=20work.work);=0A+=09struct=20=
snd_usb_audio=20*chip=20=3D=20d->mixer->chip;=0A+=09/*=200=20dB=20on=20all=20=
four=20channels=20(main=20L/R,=20cue=20L/R)=20*/=0A+=09const=20u8=20target[2=
]=20=3D=20{=200x00,=200x00=20};=0A+=09u8=20ch;=0A+=0A+=09for=20(ch=20=3D=201=
;=20ch=20<=3D=204;=20ch++)=0A+=09=09snd_usb_ctl_msg(chip->dev,=20usb_sndctrl=
pipe(chip->dev,=200),=0A+=09=09=09UAC_SET_CUR,=0A+=09=09=09USB_RECIP_INTERFA=
CE=20|=20USB_TYPE_CLASS=20|=20USB_DIR_OUT,=0A+=09=09=09(UAC_FU_VOLUME=20<<=20=
8)=20|=20ch,=0A+=09=09=09snd_usb_ctrl_intf(d->mixer->hostif)=20|=20(12=20<<=20=
8),=0A+=09=09=09(void=20*)target,=20sizeof(target));=0A+}=0A+=0A+static=20vo=
id=20audient_monitor_mix_free(struct=20usb_mixer_interface=20*mixer)=0A+{=0A=
+=09struct=20audient_mix_init=20*d=20=3D=20mixer->private_data;=0A+=0A+=09ca=
ncel_delayed_work_sync(&d->work);=0A+=09kfree(d);=0A+=09mixer->private_data=20=
=3D=20NULL;=0A+=09mixer->private_free=20=3D=20NULL;=0A+}=0A+=0A+/*=0A+=20*=20=
The=20Audient=20iD14=20MkII=20main=20monitor=20outputs=20are=20fed=20by=20a=20=
four-channel=0A+=20*=20volume=20feature=20unit=20(FU=2012)=20whose=20attenua=
tion=20is=20asymmetric=20in=20the=0A+=20*=20firmware:=20the=20left=20main=20=
channel=20ignores=20its=20volume=20value=20while=20the=0A+=20*=20right=20one=
=20applies=20it,=20so=20any=20value=20below=200=20dB=20unbalances=20the=20st=
ereo=0A+=20*=20pair.=20=20Ensure=20the=20unit=20starts=20at=20unity=20gain,=20=
like=20the=20Audient=20desktop=0A+=20*=20application=20does.=0A+=20*=0A+=20*=
=20The=20firmware=20silently=20drops=20volume=20writes=20that=20arrive=20whi=
le=20the=0A+=20*=20driver=20is=20still=20probing=20the=20device=20after=20a=20=
USB=20reset=20(the=20request=20is=0A+=20*=20ACKed=20but=20ignored),=20so=20a=
pply=20them=20from=20a=20delayed=20work=20once=20probe=20has=0A+=20*=20settl=
ed.=0A+=20*/=0A+static=20int=20audient_monitor_mix_init(struct=20usb_mixer_i=
nterface=20*mixer)=0A+{=0A+=09struct=20audient_mix_init=20*d;=0A+=0A+=09d=20=
=3D=20kzalloc_obj(*d);=0A+=09if=20(!d)=0A+=09=09return=20-ENOMEM;=0A+=09d->m=
ixer=20=3D=20mixer;=0A+=09INIT_DELAYED_WORK(&d->work,=20audient_monitor_mix_=
work);=0A+=09queue_delayed_work(system_percpu_wq,=20&d->work,=20msecs_to_jif=
fies(3000));=0A+=09mixer->private_data=20=3D=20d;=0A+=09mixer->private_free=20=
=3D=20audient_monitor_mix_free;=0A+=09return=200;=0A+}=0A+=0A=20int=20snd_us=
b_mixer_apply_create_quirk(struct=20usb_mixer_interface=20*mixer)=0A=20{=0A=20=
=09int=20err=20=3D=200;=0A@@=20-4557,6=20+4618,10=20@@=20int=20snd_usb_mixer=
_apply_create_quirk(struct=20usb_mixer_interface=20*mixer)=0A=20=09=09err=20=
=3D=20dell_dock_mixer_create(mixer);=0A=20=09=09break;=0A=20=0A+=09case=20US=
B_ID(0x2708,=200x0008):=20/*=20Audient=20iD14=20MkII=20*/=0A+=09=09err=20=3D=
=20audient_monitor_mix_init(mixer);=0A+=09=09break;=0A+=0A=20=09case=20USB_I=
D(0x2a39,=200x3fd2):=20/*=20RME=20ADI-2=20Pro=20*/=0A=20=09case=20USB_ID(0x2=
a39,=200x3fd3):=20/*=20RME=20ADI-2=20DAC=20*/=0A=20=09case=20USB_ID(0x2a39,=20=
0x3fd4):=20/*=20RME=20*/=0A--=20=0A2.56.1=0A=0A=

--Apple-Mail-11CA9384-6EA2-4A28-A0EE-EC1DC28A4C11
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit




--Apple-Mail-11CA9384-6EA2-4A28-A0EE-EC1DC28A4C11--
