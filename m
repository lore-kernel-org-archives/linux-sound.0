Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AF8414435
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575853; cv=pass; b=N2eT4H4TXPYqX8YcGQ34/zbzTEI4MriQRA2LHgsflz/H5JejoDWylp+EBnS7NEnhX/lkl52OZcaUWdzmaQMbxO+HzeQbFOTbfB7XYBCC68uJj3pv0nkg718h0Ym38sKad4nwwO1GKEw+V/0HQzemzw+bMcPiHjAcEOgxnYLgqpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575853; c=relaxed/simple;
	bh=0FjmVZsP29MPR81fb/XFfU7eUHxSH+LRgqJzVslxpSE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=h9gfb8Hb+NXT6K9JhYm119+yD0leQVcdFRXeypA0zXSF2A99cIp4zJ6cBEHGFGPOJPyQDhlLmaMJNV+AeRnFnuknnGPiocV2udBeC+6PNDmHXbtoikOLPgwdgGlFc0NwsN3XBj6sf19bCKtxtFxSS/jNekT6v3/gP9zk7fBm5NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0reIRio; arc=pass smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0reIRio"
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a7e4be64bfso17926937b3.3
        for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 23:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790575850; cv=none;
        d=google.com; s=arc-20260327;
        b=oyraJsYZKoUsQCqLpkPApzvqdJpC5tqxQ/mwriha1q02Dt1IIaJprF7zfDpLWNy0jl
         7S0buoWfSpW63vLuAqfrGGg2R6tpAaJ5stDRS2JlujZP9zOCSfqtrH9Dmw+7TNqnbHCf
         gTR9mTtLNlviioEIwobRTiViSO5K+WtrHE7njtoeF0VGY9LTaQcI4/EaYVV5eEHRCC2t
         gxVgOq0m7poAs+L/6FhNJcig063RneQVVmor0ToYA0SFHFBBWGNYQXG1Y9TolBT2V4If
         JoCx0hG7GsbMwLMg1Rp7YJlbRxk3rnwVO2T0Yrv6a8ctp21krYJ67JZvuJ1Fi9PiGLGy
         TMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=pUxxtGsBMsVGh8VIcW5gRO7TXlpHsPBLHBpoNfaT+yM=;
        fh=Ocpafz32Em8yCoJejLm6AOgxXplQQ4vmZqMErS726JE=;
        b=sz4NKp1je5aCSkV/3+HjpoTUlSppMlWf9pPmIlnNGPwlI4oijXkZYtLJruUqklk2pB
         h8vAYXLzgFUs8I7ffdALuZA2X07vrrjdG2MA7IDShlAA5UUb5CEXRDRNknI2fHRIx3XP
         hXPwQ3qyY3uf3m0kaofezDO5wcGQsavWAlOqN7zVp8YgYmrwgyhQdsFyslStmfLD/eRi
         5ZGTnPf/Kf0QjemBqKX59wHofkX7cJzYWqHPAM4V6hOoHqWzlhfnP27uNRux5q8Xq4vK
         s0+1/RUTcE56wL5cP2mejZyPoykEWC4AgBN0gLryRlhCwTK8o8m5T28DVJIggrpGODya
         N9GA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790575850; x=1791180650; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pUxxtGsBMsVGh8VIcW5gRO7TXlpHsPBLHBpoNfaT+yM=;
        b=k0reIRioR6eJMrlgwX8Ft2LN4Ag9iAd7lppPm3atLRfD1lm/dj1KLBOburnBpZGslX
         oNvIIbYABPdIA4GuBxT/59pdInzLeJWUJsgppuzKEACMCUEeF6D9c5FibmtNUpUd+Ffy
         k0uIf1X6d/iXVtZXNrFEuJDTdLYaBTD1QKvx7eNj7Ln4EbRrCjVs1236R9UI3U/+u6rh
         LMHgwAe4+nsaSuBB1C6WqI0+1fN7Z/TxKDej+Lli3MPvdln28MpID8OptkUbX4QVedtv
         +GKqUWwlZsnpYUvLGNavubRBYLEfdEeRPoxUhcvkkjhENsqcullM+CaRdBU2AeeklAMt
         LN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575850; x=1791180650;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pUxxtGsBMsVGh8VIcW5gRO7TXlpHsPBLHBpoNfaT+yM=;
        b=JnGh3yMf6oWxhmo0ZSZJhW8FCUEnhBvchWkGMWgC0XufrzvCDyU59s8bJeDGZuvloK
         eHpfxJqbXTvuIvJmkjUw0dd51/FRaYmDKPhLSVMb3g1lcalYSGZq6rhnU6D7OheJX5t5
         rsYNdaRMa0asSJEHnjNm8AgJN09A9SSbyNERMJAKSRfkwsAeW+M4FWEqT1pLmDB5Iygr
         QC/U7rGs5M0EnvM5V4c0PXtPNrLENRcpcTG1IbZ+/7O4HGhEwDin5x0U7Id7NXRKkVte
         OHjdO/9T8D35GgXhG6THcCH0JvOPVa/RJm6EbkhtCu44oomS2ZnZfmGyiy5JkMeV6tw8
         DvkA==
X-Gm-Message-State: AFq9FYJB5yyjJ+ljIDjhyl7CHcVWr6pFClbgOMwJvNlgm+uuIHjlHGXC
	fPN9/3hQk26xkxbUGxgakr5c3Df1PdAk1UxvE+zATeAnHJM2jG5S17Zj5K7mSUZPmDIlIXOKKE6
	2bl6THCD1owaXG/tUWhNZbU42w48wfdA=
X-Gm-Gg: AYBFou1vQFAEcW0hC3fTFFwfcr5+TJBzHHx/6hnBwKq4O2Q1Hg6Ol+KvmxSSht/CWxN
	WeMaMfelO0gduGC2Wrm/jFfTVba20AbRt3JKuGQthgcmZCk4IirpdZ6G3QJdCtjkJOzyJ/wlMr0
	lXJCbTzWXZ5k6QQrSHYjlWcldKVn5sKCazxXBWgDl2eRBsARuaIFI3dMB8q4WuwtRzVLybodsks
	qLtzXxBMllS30AFZ9SsAgyKQBVM57YxhyQz6WWHyKHKyEIEQVMUCBFlMT8/uePcTDaZkx+pvVRX
	Q7qvKfPCtDCpy6K60AgFoYUMsQcdeiGjevznQGiC4GLEAxyXgK618bzm6bDICtZuNp4=
X-Received: by 2002:a05:690c:498f:b0:8aa:3a3a:1fcb with SMTP id
 00721157ae682-8aa3a3a206emr9952367b3.67.1790575849598; Sun, 27 Sep 2026
 23:10:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vishranth Arunkumar <vishranth.ak@gmail.com>
Date: Mon, 28 Sep 2026 02:10:38 -0400
X-Gm-Features: AclHuK8j5f6kO9UyoZNKPZFt2Z6_tbzQCzTAsnSxaoY9CjfeGUefW5s8vxs_AWA
Message-ID: <CAL-UiWg5=ouP=GLGsoZov1WtuEmTMhHNpccUE9A2mu=QNVwJFA@mail.gmail.com>
Subject: =?UTF-8?Q?=5BBUG=5D_sof=5Fsdw=3A_MSI_Stealth_16_AI=2B_B3WH_=E2=80=94_missing_S?=
	=?UTF-8?Q?DCA_board_match_causes_1amp_topology_selection_and_silent_in?=
	=?UTF-8?Q?ternal_speakers?=
To: alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, 
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com
Content-Type: multipart/mixed; boundary="00000000000075b001065c84ed51"

--00000000000075b001065c84ed51
Content-Type: multipart/alternative; boundary="00000000000075affb065c84ed4f"

--00000000000075affb065c84ed4f
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am reporting a SoundWire/SOF issue on a recent Panther Lake laptop.

I should note up front that I am relatively new to Linux and have relied
on an LLM (DeepSeek) to assist with the investigation and diagnostic
collection. I have verified each command output reproduced below against
my running system, and I am happy to run any additional diagnostics or
provide further detail if needed. I understand that effective bug
resolution depends on accurate reports from users, and I want to make
sure this one is as useful as possible.

Summary
----------------
Internal speakers are silent on an MSI Stealth 16 AI+ B3WH (Panther Lake)
because sof_sdw has no board match for this DMI. The generic SDCA fallback
is therefore selected, which loads the single-amp function topology despite
two RT1320 SmartAmp devices being present and bound on SoundWire link 2.

Hardware
----------------
DMI:
  sys_vendor      = Micro-Star International Co., Ltd.
  product_name = Stealth 16 AI+ B3WH
  board_name    = MS-2631

SoundWire enumeration (confirmed via sysfs and kernel log):

  link 2:
    sdw:0:2:025d:1320:01:0   status: Attached   driver: rt1320-sdca
    sdw:0:2:025d:1320:01:1   status: Attached   driver: rt1320-sdca
  link 3:
    sdw:0:3:025d:0713:01     status: Attached   driver: rt712-sdca

Both RT1320 devices probe successfully and expose complete mixer control
sets (rt1320-1 and rt1320-2). All OT23 output switches report [on].

Observed behaviour
----------------
  $ sudo journalctl -k -b | grep -iE "sof|sdca|topology"

  acpi device:3a: SDCA function SmartAmp (type 1) at 0x4
  acpi device:3c: SDCA function SmartAmp (type 1) at 0x4
  acpi device:37: SDCA function UAJ (type 6) at 0x1
  acpi device:38: SDCA function SmartMic (type 3) at 0x2

  sof-audio-pci-intel-ptl 0000:00:1f.3: No SoundWire machine driver found
      for the ACPI-reported configuration:
  sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x025d part_id 0x1320
version 0x3
  sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x025d part_id 0x1320
version 0x3
  sof-audio-pci-intel-ptl 0000:00:1f.3: link 3 mfg_id 0x025d part_id 0x0713
version 0x3
  sof-audio-pci-intel-ptl 0000:00:1f.3: Use SoundWire default machine driver
      with function topologies

  ...
  loading topology 0: intel/sof-ipc4-tplg/sof-sdca-1amp-id2.tplg
  loading topology 1: intel/sof-ipc4-tplg/sof-sdca-jack-id0.tplg
  loading topology 2: intel/sof-ipc4-tplg/sof-sdca-mic-id4.tplg

Result
----------------
  - The 1amp SDCA function topology is loaded instead of a 2amp variant.
  - Both RT1320 codecs probe successfully and expose full control sets;
    all output switches are enabled.
  - PipeWire exposes a Speaker sink (default) but playback is silent.
  - The headphone jack (RT712) path works correctly.

The firmware provides a matching legacy topology file
(sof-ptl-rt712-l3-rt1320-l2.tplg) that is not selected, since the generic
SDCA path is active and the machine driver is absent. The 2amp SDCA
function topology (sof-sdca-2amp-id2.tplg) is also present but not chosen.

Userspace workarounds attempted
----------------
Both of the following were tried and rejected:

  - snd_soc_sof_sdw quirk=<value>
    The quirk bit definitions reside in
    sound/soc/intel/boards/sof_sdw_common.h, which is not shipped with
    kernel-devel. The available header
    (include/sound/soc_sdw_utils.h) documents no 2-amp bit for SDCA.
    amp_num is a const field in the codec-info table and cannot be
    overridden from userspace.

  - snd_sof.disable_function_topology=1
    On SOF firmware 2.14.1.1 the function topology path is mandatory.
    Forcing it off produces:

        Function topology is required, please upgrade sof-firmware
        error: failed to load DSP topology -22
        ASoC error (-22): at snd_soc_component_probe()

    The entire SOF card fails to instantiate; PipeWire falls back to
    Dummy Output, losing even the working headphone path.

Test environment
----------------
  Kernel:       7.2.4-ogc3.1.fc44.x86_64 (OGC custom, Bazzite)
  SOF firmware: 2.14.1.1

alsa-info.sh --no-upload output is attached (gzipped).

Reported-by:

Vishranth Arun Kumar
vishranth.ak@gmail.com

--00000000000075affb065c84ed4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br><div>I am reporting a SoundWire/SOF issue o=
n a recent Panther Lake laptop.</div><div><br></div>I should note up front =
that I am relatively new to Linux and have relied<br>on an LLM (DeepSeek) t=
o assist with the investigation and diagnostic<br>collection. I have verifi=
ed each command output reproduced below against<br>my running system, and I=
 am happy to run any additional diagnostics or<br>provide further detail if=
 needed. I understand that effective bug<br>resolution depends on accurate =
reports from users, and I want to make<br>sure this one is as useful as pos=
sible.<br><br>Summary<br>----------------<br>Internal speakers are silent o=
n an MSI Stealth 16 AI+ B3WH (Panther Lake)<br>because sof_sdw has no board=
 match for this DMI. The generic SDCA fallback<br>is therefore selected, wh=
ich loads the single-amp function topology despite<br>two RT1320 SmartAmp d=
evices being present and bound on SoundWire link 2.<br><br>Hardware<br>----=
------------<br>DMI:<br>=C2=A0 sys_vendor=C2=A0 =C2=A0 =C2=A0 =3D Micro-Sta=
r International Co., Ltd.<br>=C2=A0 product_name =3D Stealth 16 AI+ B3WH<br=
>=C2=A0 board_name=C2=A0 =C2=A0 =3D MS-2631<br><br>SoundWire enumeration (c=
onfirmed via sysfs and kernel log):<br><br>=C2=A0 link 2:<br>=C2=A0 =C2=A0 =
sdw:0:2:025d:1320:01:0 =C2=A0 status: Attached =C2=A0 driver: rt1320-sdca<b=
r>=C2=A0 =C2=A0 sdw:0:2:025d:1320:01:1 =C2=A0 status: Attached =C2=A0 drive=
r: rt1320-sdca<br>=C2=A0 link 3:<br>=C2=A0 =C2=A0 sdw:0:3:025d:0713:01 =C2=
=A0 =C2=A0 status: Attached =C2=A0 driver: rt712-sdca<br><br>Both RT1320 de=
vices probe successfully and expose complete mixer control<br>sets (rt1320-=
1 and rt1320-2). All OT23 output switches report [on].<br><br>Observed beha=
viour<br>----------------<br>=C2=A0 $ sudo journalctl -k -b | grep -iE &quo=
t;sof|sdca|topology&quot;<br><br>=C2=A0 acpi device:3a: SDCA function Smart=
Amp (type 1) at 0x4<br>=C2=A0 acpi device:3c: SDCA function SmartAmp (type =
1) at 0x4<br>=C2=A0 acpi device:37: SDCA function UAJ (type 6) at 0x1<br>=
=C2=A0 acpi device:38: SDCA function SmartMic (type 3) at 0x2<br><br>=C2=A0=
 sof-audio-pci-intel-ptl 0000:00:1f.3: No SoundWire machine driver found<br=
>=C2=A0 =C2=A0 =C2=A0 for the ACPI-reported configuration:<br>=C2=A0 sof-au=
dio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x025d part_id 0x1320 version=
 0x3<br>=C2=A0 sof-audio-pci-intel-ptl 0000:00:1f.3: link 2 mfg_id 0x025d p=
art_id 0x1320 version 0x3<br>=C2=A0 sof-audio-pci-intel-ptl 0000:00:1f.3: l=
ink 3 mfg_id 0x025d part_id 0x0713 version 0x3<br>=C2=A0 sof-audio-pci-inte=
l-ptl 0000:00:1f.3: Use SoundWire default machine driver<br>=C2=A0 =C2=A0 =
=C2=A0 with function topologies<br><br>=C2=A0 ...<br>=C2=A0 loading topolog=
y 0: intel/sof-ipc4-tplg/sof-sdca-1amp-id2.tplg<br>=C2=A0 loading topology =
1: intel/sof-ipc4-tplg/sof-sdca-jack-id0.tplg<br>=C2=A0 loading topology 2:=
 intel/sof-ipc4-tplg/sof-sdca-mic-id4.tplg<br><br>Result<br>---------------=
-<br>=C2=A0 - The 1amp SDCA function topology is loaded instead of a 2amp v=
ariant.<br>=C2=A0 - Both RT1320 codecs probe successfully and expose full c=
ontrol sets;<br>=C2=A0 =C2=A0 all output switches are enabled.<br>=C2=A0 - =
PipeWire exposes a Speaker sink (default) but playback is silent.<br>=C2=A0=
 - The headphone jack (RT712) path works correctly.<br><br>The firmware pro=
vides a matching legacy topology file<br>(sof-ptl-rt712-l3-rt1320-l2.tplg) =
that is not selected, since the generic<br>SDCA path is active and the mach=
ine driver is absent. The 2amp SDCA<br>function topology (sof-sdca-2amp-id2=
.tplg) is also present but not chosen.<br><br>Userspace workarounds attempt=
ed<br>----------------<br>Both of the following were tried and rejected:<br=
><br>=C2=A0 - snd_soc_sof_sdw quirk=3D&lt;value&gt;<br>=C2=A0 =C2=A0 The qu=
irk bit definitions reside in<br>=C2=A0 =C2=A0 sound/soc/intel/boards/sof_s=
dw_common.h, which is not shipped with<br>=C2=A0 =C2=A0 kernel-devel. The a=
vailable header<br>=C2=A0 =C2=A0 (include/sound/soc_sdw_utils.h) documents =
no 2-amp bit for SDCA.<br>=C2=A0 =C2=A0 amp_num is a const field in the cod=
ec-info table and cannot be<br>=C2=A0 =C2=A0 overridden from userspace.<br>=
<br>=C2=A0 - snd_sof.disable_function_topology=3D1<br>=C2=A0 =C2=A0 On SOF =
firmware 2.14.1.1 the function topology path is mandatory.<br>=C2=A0 =C2=A0=
 Forcing it off produces:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Function topol=
ogy is required, please upgrade sof-firmware<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error: failed to load DSP topology -22<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASoC=
 error (-22): at snd_soc_component_probe()<br><br>=C2=A0 =C2=A0 The entire =
SOF card fails to instantiate; PipeWire falls back to<br>=C2=A0 =C2=A0 Dumm=
y Output, losing even the working headphone path.<br><br>Test environment<b=
r>----------------<br>=C2=A0 Kernel: =C2=A0 =C2=A0 =C2=A0 7.2.4-ogc3.1.fc44=
.x86_64 (OGC custom, Bazzite)<br>=C2=A0 SOF firmware: 2.14.1.1<br><br>alsa-=
info.sh --no-upload output is attached (gzipped).<br><br><div>Reported-by:<=
/div><div><br></div><div>Vishranth Arun Kumar</div><div><a href=3D"mailto:v=
ishranth.ak@gmail.com">vishranth.ak@gmail.com</a></div></div>

--00000000000075affb065c84ed4f--
--00000000000075b001065c84ed51
Content-Type: application/gzip; name="alsa-info.txt.sIsqx0ZgeR.gz"
Content-Disposition: attachment; filename="alsa-info.txt.sIsqx0ZgeR.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_mukuht1b0>
X-Attachment-Id: f_mukuht1b0

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
ywAA
--00000000000075b001065c84ed51--
