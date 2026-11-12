Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495386;
	b=miZLkPszQA9O0ESUQgCw96iokvT2VQ/zjBq4ZiwRvcgkDMR34nhxUgDpGckf15IeUtlc
	 30M7Ci4aiw7QCZKEe7iWGm/uotzw/zTSQDogBE0yEXi9dhbACounpQUJ/Io1ZjntnWujD
	 uo3dH+HlfWB5JqwMq/KLbxXvk1ZVP/7aWhhPIpI9rMG0XB8EuJI1+ZCd5da7H4WHGGATV
	 FyoFormvkYc4dhaJVXyL4PofEIg7hLbNtb8nkD4/QhM5FaKvAygmTHIA1J7V9oktAOw24
	 4/X+rtwbe5UYBubb3A+dia7FlYGHpNH8VqTtJR8Ef+OKvSAWxW+9YgY0s4b1XOeVtSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495386;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GsQRcCft6Z382GN6+jPlmqlkzghZue3ReBUd5vPL7zQ=;
	b=WWv5hjM1IdxxWpUN3EwEt3UAcqXkCFTzGgxi9aoFvvw7TLJn1Ze1VGyKu6H9XnmoiniS
	 NsqfyyDf/eUzhEhyS8SMp/UgTl+FhhnQYSuVkawh6PfAenDadVSsZnFwX3n9MjHy8ml+0
	 d25/TAlKyJ3KyG8NjnbJcLCsSU6ltAfAj9ii27WSVW+C9huq8A0Xt0GpPZIft9S5fKnl1
	 pVV/PabAeQjOTMqd489APTyUnFdxYDDrziQEJrYwZXawMcchUq+LGarkiVpd5ZBm3Gddk
	 Gmj6LVtEg1RUeb7mglSqF+JvL/LbMUPdKN3hNshzDHkwJDKtqlruV9Sv8+xKa7C4Ktg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=kd6nQL9F;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452A8606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 14:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 452A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=kd6nQL9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794495383; x=1794754583;
	bh=GsQRcCft6Z382GN6+jPlmqlkzghZue3ReBUd5vPL7zQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kd6nQL9FdEJ2KF3kbsgZbN/jqDwX61GMVml0JVfkdi/O5KTGn73TEVXHUWTl3Ky8L
	 Y6p5dhNkuPYBO6mZLj9uXHldyIE5Nv+rAZcrPfJSjM4c5vhaiMClwRcCJVDgJcLlsF
	 3qOoLRlhHndqTiR0GaQoAPr5OdpB1xVDZLS1CAtUie+ObPXd441PNFdGhw+F/mDGRY
	 ZsZjIrzcV4uo4/FsVKGPqPfx2m+8iO7FCGrA6EIsuO8Bqxe2RKdZ816KKdJfFfxsOq
	 3zyCE7+nYsf4a3YJ9vAuROuNSENsgS2I9kGwNQs90QdGfaViXsYUrcfVhsRtDV95Vf
	 t/jtThvoGp7uw==
Date: Thu, 12 Nov 2026 14:56:20 +0000
To: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
From: H7628h <H7628h@protonmail.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>, "perex@perex.cz" <perex@perex.cz>
Subject: ALSA: hda/realtek: LG 22V280 (ALC256, 1854:0308) internal speakers intermittently silent, needs coef 0x10 bits 13-14
Message-ID: <h93ftv1OWd4nQb9SwejOqSmxahololqmoRffInUDsPCeFG1jYfxSETU6k7TcvDBXUjgaDgXPU3MymdJ9iNwijUPYhOAURt53jU7ChHVa544=@protonmail.com>
Feedback-ID: 30170416:user:proton
X-Pm-Message-ID: 769c70810666dbd2269c051e80965f3d7e067508
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On the LG 22V280 All-in-One (Realtek ALC256, codec SSID 0x18540308), the
internal speakers are silent from boot on some boots. It looks random. When
that happens, headphones on the same codec work perfectly. The machine neve=
r
had this problem with the vendor's Windows driver. There is currently no qu=
irk
for 1854:0308 in sound/hda/codecs/realtek/alc269.c.

Hardware / software
  System:     LG Electronics 22V280 (All-in-One)
  BIOS:       Phoenix 22VC0332 (2021-03-04)
  Controller: Intel Celeron/Pentium Silver (Gemini Lake) HDA [8086:3198],
              subsystem 1854:0308, snd_hda_intel (dsp_driver=3D1)
  Codec:      Realtek ALC256, Vendor Id 0x10ec0256, Subsystem Id 0x18540308=
,
              Revision Id 0x100002
  Pins:       speaker on 0x1b (pincfg 0x90170110, fixed internal speaker),
              headphone on 0x21 (0x03211020), 0x14 unused (0x411111f0)
  Kernel:     6.12.116 (Debian 13); no relevant kernel messages in either s=
tate

Symptoms in the failing state
  - The PCM is RUNNING and data is flowing. A tone played directly on plugh=
w:0,0
    (with no sound server running) is still silent on the speakers.
  - The mixer is identical to a working boot: Speaker switch on, volume at =
max,
    Master on.
  - Pin 0x1b is OUT (Pin-ctls 0x40), EAPD is set on 0x14/0x1b/0x21, connect=
ion
    select and power state are D0, and GPIO data/mask/direction are 0. All =
of
    this is identical to a working boot.
  - Toggling EAPD, re-writing pin controls, and driving GPIO0-2 do not help=
.
  - Neither does a full unbind/bind of snd_hda_intel.
  - A reboot fixes it until the next bad boot.

Root cause
I dumped all ALC256 processing coefficients (node 0x20, index 0x00-0x7f) in
a failing boot and in a working boot, both with headphones plugged in so
that jack-dependent coefs match. Only two coefficients differ:

            failing   working
  0x10      0x1820    0x7820    (bits 13 and 14)
  0x35      0x0d6a    0x8d6a    (bit 15)

Then, in a working boot:
  - clearing bits 13-14 of coef 0x10 (0x7820 -> 0x1820) silences the
    speakers immediately, and setting them again restores sound;
  - clearing bit 15 of coef 0x35 has no audible effect.

So it looks like the firmware sometimes leaves coef 0x10 bits 13-14 cleared=
,
and the driver never sets them. The kernel already touches coef 0x10 on ALC=
256
for a speaker issue on the Xiaomi Mi Laptop Pro 15 (alc256_fixup_xiaomi_pro=
15_resume,
bit 9), so this seems to be the same kind of problem.

Workaround (tested)
The HDA patch loader with the following file, loaded via
"options snd-hda-intel patch=3D<file>", makes the speakers work on every bo=
ot so far:

  [codec]
  0x10ec0256 0x18540308 0

  [verb]
  0x20 0x500 0x10
  0x20 0x400 0x7820

After boot, /sys/class/sound/hwC0D0/init_verbs shows the two verbs applied.

Suggested quirk (untested as a kernel patch; only the equivalent verbs abov=
e
were tested)

  static void alc256_fixup_lg_speaker_coef(struct hda_codec *codec,
                                           const struct hda_fixup *fix,
                                           int action)
  {
          /*
           * LG 22V280 (1854:0308): the firmware sometimes leaves ALC256
           * coef 0x10 bits 13-14 cleared, which silences the internal
           * speakers. Set them on every init (boot and resume).
           */
          if (action =3D=3D HDA_FIXUP_ACT_INIT)
                  alc_update_coef_idx(codec, 0x10, 0x6000, 0x6000);
  }

  [ALC256_FIXUP_LG_SPEAKER_COEF] =3D {
          .type =3D HDA_FIXUP_FUNC,
          .v.func =3D alc256_fixup_lg_speaker_coef,
  },

  SND_PCI_QUIRK(0x1854, 0x0308, "LG 22V280", ALC256_FIXUP_LG_SPEAKER_COEF),

I don't know what coef 0x10 bits 13-14 mean internally. If Realtek
documentation suggests a different or more appropriate fix, I'm happy to te=
st
patches on this machine.

More details and the scripts used for the test:
https://github.com/librarianBR/alc256-lg-speaker-fix

Thanks!

