Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0218F46C4BE
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791193401; cv=pass; b=U0/nshObb8542cW82yXLcvuCy9YgE3VXJg/RbmukkZSU78yQGhA+lg7RgJueh1ORgDEy/G9ItzKf/I8RzJuBi/VD01pQdy3o0lhMl0OI9HYisANzeMN8hQUIng6lW/O8iIMLfqRMXyvn9R27RQSFXzd3NrnmBUyLtIHaja38lhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791193401; c=relaxed/simple;
	bh=YzSonRM/D5S7t5zBOEg6h34vfkPRJEtcFHfnieYfrG4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HhXyaOlvpBAuN9ougi3lWJOMBnFOVRsOdJ5/njGSkLRmZqIwnfXlQV/SjmQgzI9TFnQmY+5+8UnpzQzcOIt4tyXvDehjP6Sf5hNJSr63MH1CHaClNoGFEsjzwf/gTh7BoH1qheJ4e1mAiSk2QPPPFfQV5dgjYUXvKT+NyMDG2LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtSjlNa3; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtSjlNa3"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7bf5f3736d2so733835137.0
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 02:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791193395; cv=none;
        d=google.com; s=arc-20260327;
        b=gxhPHhRMjabLGlKv7p+Jg0wesl++A8cD9a5/5LfN0YEklJlKPhnpKAGOJVp66zYs6L
         ltebIdWrgxMq1vZPwZMk6I2ATA3G4nwbI1CKIfwLAw9lwkcv0RIzDW9+xpNfpp2Hcobm
         xY8J9BXEkIeJYEip6nUZbRFUbLXnIelDhgA440j1LkcwXC3ZlQPitpy137XOHMvHQ5YG
         qheLEZHggNzg9UdUkjbAnm7JxwuWcFKtjFd2gzmBb9Tzeq0ExPf/tqQrqNg+BAAvbyE6
         nMhm+aUxkbIrcAqN4qlD/Z34TgVl9cXazHSU9o+FQEACaGZrj9gJH0upkl+Vhok7X+lQ
         rw3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dFfm3ppIQVHqf2nssPCTW3vfOTjrLZ5fr0UHm6mkAOM=;
        fh=KH/eX7jUCHca3rYS8rYf76YoNF9c1GGVCnLDYiBbPlc=;
        b=J8Bf2mkjUI9/vtmnuipHfSKdeKXMgEWijMlHVLrkqPjAp6fFMi7EDwvlH5QmIllz0D
         8I4vtvPEZyhxmVPudZO2q17kKEa5GNy1lP7Gq0MouQrivSlv3XEmvMyYLRWAvYGp7NZr
         zk4kZjH7ekjXp1UjHyVEC8GJaZhrDWVgcOwp7INft8kgfO1u1CrZxFGNzgWMykMqO2eG
         I2y0yp3U3HijXp3jhFMwpTeMcviWBnQiHXdEZfcbK3/qydBWziDEOmmFOFyOeNle8T3/
         4ZC1AaK6QwjNlTm5BvnWwdXKUD2Pf0QpWxmRuJisPOfRZu8/HP51X6f+7J7YMVuyawri
         OA4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193395; x=1791798195; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFfm3ppIQVHqf2nssPCTW3vfOTjrLZ5fr0UHm6mkAOM=;
        b=ZtSjlNa3W2Ya41M+ZWd+hwJLIfkW8CMz6VGmo6T0wMY6MbJYR4syfhS9uZF0h16kEm
         Z2fkc/BKCJU7znCTY3dcGdCe2qYoJOhBMmMjHQtoqsF1e3mCzBMQwos+dUF9G1uK6Hu7
         LYBtk7TpPBLmy0UJI663SIeki9Z/1hc/q3frSOJp5YUpsF5UPvp3IqU1kHy7Z8oCp2hO
         rETJG+WLdn9XeSGBscSYiQuQaOkVNvv4iWV8TW6KyneUtNlv2/J1uxokpmFE27wfzbQx
         bw9CrUoO1IIVPjNoj3SAXm+/jsd4yrMjdqoyEzZRptPo+u8IzlIJ2c1xMx2+QCEk/L9v
         CZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193395; x=1791798195;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dFfm3ppIQVHqf2nssPCTW3vfOTjrLZ5fr0UHm6mkAOM=;
        b=lT8gSmk2a7gvh4khF6683LDNmMQzYgaypyXwuHduhJ2KzKE7nWtBG2ysaBMwBhBImF
         c9Al0jN3cwAKSOPFYUi3qHB2ejYX4otvLDSqltwRhnv43n6AcV7DaKksFHTlPe2Q0vAQ
         YKy6zJDi5ccLXGKd0LMInidi6OlF+YD/FabynCthf40GN3HzWgtDtiUwges7wPprJw/z
         LiPf8ioxUjiNjkNtwj9GJB8nTqw5EpOyr33aOALsTMOn2fKnMjCQCjZMjJ6UX34aNBne
         JSxAXUlzqsq+jaU9v/hvU0Tl8Z9RbL6iWBEK4vHjiM1dFBHIBCSGm4idJlZKLiskfsXx
         M9NQ==
X-Gm-Message-State: AFq9FYKVHQdaoyIg3YttTto0N72+Soc5SZPgzFzl1Hpi4SNdhXdCIIMI
	hc/kGPibPxVlwpytYrOB54e1gI/al6IkXudtBujsZnG1xNRS/M+BADjVAsG3P5d/5e49qCvYllu
	tWwIPypLn4/hChb/D7mm/N09XrUelT2Y5+JA7ZyGs+g==
X-Gm-Gg: AYBFou2+489+4SkFEnRDoItH1n0SQAn2NgsAYjhuvZ370Zcc3qIawSGdC69woGNM1WR
	UaNgn7Rs6Q5SLeOfqLHHqoWbeSf7TIgg3zb8hOc79EMIYDQs7zNQSWt7inUWhlGnBZojUIgvCXl
	Db0roozWnYEI7Uz+ZTy7MZGUmPtKppVlmo9LRmuIBEYaU//Dh5i+ef0ugs2lJamTptwHi/OWkVS
	8ZRz3hzWVWGnyZK8xlt4o7IvdV2iEzF8s4eH/LqHe9fPmix8AgA4Hg0e7ck8Sr/ylZz1D5VEWmM
	aJ0E5D96TTupi7zHRHLcgMFlt3ntyDv1m7WOkto816SDEWCzrR+9ydXbk42+WYbyQ1eeL8zzPDH
	tqAneEB+88w==
X-Received: by 2002:a05:6102:f8d:b0:7bc:dd88:add with SMTP id
 ada2fe7eead31-7c244da9c7cmr1818474137.14.1791193394756; Mon, 05 Oct 2026
 02:43:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0JXQktCT0JXQndCY0Jkg0KjQmNCo0JrQmNCd?= <evshish@gmail.com>
Date: Mon, 5 Oct 2026 12:42:59 +0300
X-Gm-Features: AclHuK_wu4wVs0f6oXcEEl-WPtNAiuR7rkvlN0lMaqDJeyrKL4uM3-7lAvJ1K2s
Message-ID: <CAAFU8NMJHZuPFehLpD3ZJG4eT6qp1HWkbT_yxkLYM1U1-EvUsA@mail.gmail.com>
Subject: [BUG] snd_hda_intel: bogus POSBUF position on Haswell HDMI causes A/V
 desync; LPIB is correct
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Content-Type: multipart/mixed; boundary="00000000000004e619065d14b659"

--00000000000004e619065d14b659
Content-Type: multipart/alternative; boundary="00000000000004e617065d14b657"

--00000000000004e617065d14b657
Content-Type: text/plain; charset="UTF-8"

Hello,

I'd like to report a position-buffer accuracy bug on the Haswell HDMI
audio controller that causes audible A/V desynchronization. The same
problem is already worked around for Broadwell in intel.c, but Haswell
still uses the broken path by default.

== Environment ==
- Dell Latitude E7440, Haswell-ULT
- iGPU 8086:0a16, HDMI audio controller 8086:0a0c, PCH HDA 8086:9c20
- Kernel: 7.2.5 (Arch Linux)
- Sink: Samsung TV over HDMI, 1920x1080@60 (148.5 MHz pixel clock),
  PipeWire playback; reproduces with plain aplay as well (device-level,
  not userspace-specific).

== Symptom ==
With the default position_fix=-1, the position reported for HDMI
playback advances faster than real time:

- hw_ptr slope vs CLOCK_MONOTONIC: +4376 .. +9674 ppm over several
  150 s runs (varied between runs); +237917 ppm at 1280x720@60.
- The excess comes from discrete forward jumps of the position value
  (+400 .. +15000 frames, dozens per 150 s); the baseline rate between
  jumps is approximately exact.
- The analog codec on the same machine (00:1b.0) measures -34 ppm with
  the same method (healthy control).

Media stacks follow this bogus position (PipeWire clocks its graph from
the device position), so they push data faster than the hardware
consumes it. The real DMA buffer fills up and overruns every ~130 s,
producing audible glitches and A/V resync - the classic "sound drifts
from picture, then rips every ~2 minutes" symptom. The /proc status
"delay" field does not reveal the problem, because appl_ptr chases the
same bogus hw_ptr 1:1.

== Evidence that POSBUF is at fault, not the hardware clock ==
- position_fix=1 (LPIB): hw_ptr slope -30.5 ppm, ZERO jumps over 150 s
  (same test, same machine, no other changes).
- Default (POSBUF): +9674 ppm, 64 jumps / 150 s, jitter sd = 219
  frames per 0.5 s sample (vs sd = 29 with LPIB).
- Period IRQ rate is normal in both cases (46.7/s for period=1024),
  so this is not an IRQ-storm artifact.
- The error is strongly mode-dependent (1080p60 ~1%, 720p60 ~24%) -
  inconsistent with a real clock error, consistent with broken display
  position accounting.

== Code analysis ==
sound/hda/controllers/intel.c:

  /* HSW HDMI */
  #define AZX_DCAPS_INTEL_HASWELL \
(/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_COUNT_LPIB_DELAY |\
AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I915_COMPONENT |\
AZX_DCAPS_SNOOP_TYPE(SCH))

No AZX_DCAPS_POSFIX_LPIB -> check_position_fix() returns POS_FIX_AUTO
-> azx_position_ok() selects azx_get_pos_posbuf().

Meanwhile:

  /* Broadwell HDMI can't use position buffer reliably, force to use LPIB */
  #define AZX_DCAPS_INTEL_BROADWELL \
(/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_POSFIX_LPIB |\
AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I915_COMPONENT |\
AZX_DCAPS_SNOOP_TYPE(SCH))

Broadwell, the same generation of integrated display audio, is forced
to LPIB for exactly this reason; Haswell is not.

== Suggested fix ==
Make Haswell behave like Broadwell:

--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ ... @@
 /* HSW HDMI */
 #define AZX_DCAPS_INTEL_HASWELL \
- (/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_COUNT_LPIB_DELAY |\
+ (/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_POSFIX_LPIB |\
+ AZX_DCAPS_COUNT_LPIB_DELAY |\
  AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I915_COMPONENT |\
  AZX_DCAPS_SNOOP_TYPE(SCH))

(A quirk entry for 8086:0a0c in position_fix_list would be an
alternative if the caps change is considered too broad.)

== Workaround (confirmed working) ==
options snd_hda_intel position_fix=1

== Reproducer ==
1. Play silence over HDMI:
     aplay -D hw:0,3 -f S32_LE -r 48000 -c 2 \
       --buffer-size=32768 --period-size=1024 /dev/zero
2. Every 0.5 s read "hw_ptr" from
   /proc/asound/card0/pcm3p/sub0/status, timestamp with
   time.monotonic(), fit the slope over 150 s.
   - position_fix=-1: slope ~1-24% high, visible forward jumps.
   - position_fix=1: slope nominal (-30 ppm), no jumps.

I have not tested a mainline kernel yet, only 7.2.5 as shipped by Arch.
Happy to run further tests or try a proposed patch.

Thanks!

--00000000000004e617065d14b657
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I&#39;d like to report a position-buffer acc=
uracy bug on the Haswell HDMI<br>audio controller that causes audible A/V d=
esynchronization. The same<br>problem is already worked around for Broadwel=
l in intel.c, but Haswell<br>still uses the broken path by default.<br><br>=
=3D=3D Environment =3D=3D<br>- Dell Latitude E7440, Haswell-ULT<br>- iGPU 8=
086:0a16, HDMI audio controller 8086:0a0c, PCH HDA 8086:9c20<br>- Kernel: 7=
.2.5 (Arch Linux)<br>- Sink: Samsung TV over HDMI, 1920x1080@60 (148.5 MHz =
pixel clock),<br>=C2=A0 PipeWire playback; reproduces with plain aplay as w=
ell (device-level,<br>=C2=A0 not userspace-specific).<br><br>=3D=3D Symptom=
 =3D=3D<br>With the default position_fix=3D-1, the position reported for HD=
MI<br>playback advances faster than real time:<br><br>- hw_ptr slope vs CLO=
CK_MONOTONIC: +4376 .. +9674 ppm over several<br>=C2=A0 150 s runs (varied =
between runs); +237917 ppm at 1280x720@60.<br>- The excess comes from discr=
ete forward jumps of the position value<br>=C2=A0 (+400 .. +15000 frames, d=
ozens per 150 s); the baseline rate between<br>=C2=A0 jumps is approximatel=
y exact.<br>- The analog codec on the same machine (00:1b.0) measures -34 p=
pm with<br>=C2=A0 the same method (healthy control).<br><br>Media stacks fo=
llow this bogus position (PipeWire clocks its graph from<br>the device posi=
tion), so they push data faster than the hardware<br>consumes it. The real =
DMA buffer fills up and overruns every ~130 s,<br>producing audible glitche=
s and A/V resync - the classic &quot;sound drifts<br>from picture, then rip=
s every ~2 minutes&quot; symptom. The /proc status<br>&quot;delay&quot; fie=
ld does not reveal the problem, because appl_ptr chases the<br>same bogus h=
w_ptr 1:1.<br><br>=3D=3D Evidence that POSBUF is at fault, not the hardware=
 clock =3D=3D<br>- position_fix=3D1 (LPIB): hw_ptr slope -30.5 ppm, ZERO ju=
mps over 150 s<br>=C2=A0 (same test, same machine, no other changes).<br>- =
Default (POSBUF): +9674 ppm, 64 jumps / 150 s, jitter sd =3D 219<br>=C2=A0 =
frames per 0.5 s sample (vs sd =3D 29 with LPIB).<br>- Period IRQ rate is n=
ormal in both cases (46.7/s for period=3D1024),<br>=C2=A0 so this is not an=
 IRQ-storm artifact.<br>- The error is strongly mode-dependent (1080p60 ~1%=
, 720p60 ~24%) -<br>=C2=A0 inconsistent with a real clock error, consistent=
 with broken display<br>=C2=A0 position accounting.<br><br>=3D=3D Code anal=
ysis =3D=3D<br>sound/hda/controllers/intel.c:<br><br>=C2=A0 /* HSW HDMI */<=
br>=C2=A0 #define AZX_DCAPS_INTEL_HASWELL \<br>(/*AZX_DCAPS_ALIGN_BUFSIZE |=
*/ AZX_DCAPS_COUNT_LPIB_DELAY |\<br>AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I915_C=
OMPONENT |\<br>AZX_DCAPS_SNOOP_TYPE(SCH))<br><br>No AZX_DCAPS_POSFIX_LPIB -=
&gt; check_position_fix() returns POS_FIX_AUTO<br>-&gt; azx_position_ok() s=
elects azx_get_pos_posbuf().<br><br>Meanwhile:<br><br>=C2=A0 /* Broadwell H=
DMI can&#39;t use position buffer reliably, force to use LPIB */<br>=C2=A0 =
#define AZX_DCAPS_INTEL_BROADWELL \<br>(/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_D=
CAPS_POSFIX_LPIB |\<br>AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I915_COMPONENT |\<b=
r>AZX_DCAPS_SNOOP_TYPE(SCH))<br><br>Broadwell, the same generation of integ=
rated display audio, is forced<br>to LPIB for exactly this reason; Haswell =
is not.<br><br>=3D=3D Suggested fix =3D=3D<br>Make Haswell behave like Broa=
dwell:<br><br>--- a/sound/hda/controllers/intel.c<br>+++ b/sound/hda/contro=
llers/intel.c<br>@@ ... @@<br>=C2=A0/* HSW HDMI */<br>=C2=A0#define AZX_DCA=
PS_INTEL_HASWELL \<br>- (/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_COUNT_LPIB=
_DELAY |\<br>+ (/*AZX_DCAPS_ALIGN_BUFSIZE |*/ AZX_DCAPS_POSFIX_LPIB |\<br>+=
 AZX_DCAPS_COUNT_LPIB_DELAY |\<br>=C2=A0 AZX_DCAPS_PM_RUNTIME | AZX_DCAPS_I=
915_COMPONENT |\<br>=C2=A0 AZX_DCAPS_SNOOP_TYPE(SCH))<br><br>(A quirk entry=
 for 8086:0a0c in position_fix_list would be an<br>alternative if the caps =
change is considered too broad.)<br><br>=3D=3D Workaround (confirmed workin=
g) =3D=3D<br>options snd_hda_intel position_fix=3D1<br><br>=3D=3D Reproduce=
r =3D=3D<br>1. Play silence over HDMI:<br>=C2=A0 =C2=A0 =C2=A0aplay -D hw:0=
,3 -f S32_LE -r 48000 -c 2 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0--buffer-size=3D=
32768 --period-size=3D1024 /dev/zero<br>2. Every 0.5 s read &quot;hw_ptr&qu=
ot; from<br>=C2=A0 =C2=A0/proc/asound/card0/pcm3p/sub0/status, timestamp wi=
th<br>=C2=A0 =C2=A0time.monotonic(), fit the slope over 150 s.<br>=C2=A0 =
=C2=A0- position_fix=3D-1: slope ~1-24% high, visible forward jumps.<br>=C2=
=A0 =C2=A0- position_fix=3D1: slope nominal (-30 ppm), no jumps.<br><br>I h=
ave not tested a mainline kernel yet, only 7.2.5 as shipped by Arch.<br>Hap=
py to run further tests or try a proposed patch.<br><br>Thanks!</div>

--00000000000004e617065d14b657--
--00000000000004e619065d14b659
Content-Type: application/octet-stream; 
	name="0001-ALSA-hda-intel-Force-LPIB-position-fix-on-Haswell-HD.patch"
Content-Disposition: attachment; 
	filename="0001-ALSA-hda-intel-Force-LPIB-position-fix-on-Haswell-HD.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_muv28zp50>
X-Attachment-Id: f_muv28zp50

RnJvbSA0MDc5MmE1MDhkYzg1Yzk4MDdhOWViYzlkNTI4Y2FlN2M1MjRmYjczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFdmdlbml5IFNoaXNoa2luIDxldnNoaXNoQGdtYWlsLmNvbT4K
RGF0ZTogU2F0LCAzIE9jdCAyMDI2IDIxOjU2OjU0ICswMzAwClN1YmplY3Q6IFtQQVRDSF0gQUxT
QTogaGRhL2ludGVsOiBGb3JjZSBMUElCIHBvc2l0aW9uIGZpeCBvbiBIYXN3ZWxsIEhETUkKVG86
IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZwpDYzogdGl3YWlAc3VzZS5kZQoKQnJvYWR3ZWxs
IEhETUkgaXMgZm9yY2VkIHRvIHRoZSBMUElCIHBvc2l0aW9uIGZpeCBiZWNhdXNlIHRoZSBwb3Np
dGlvbgpidWZmZXIgb2YgdGhlIGludGVncmF0ZWQgZGlzcGxheSBhdWRpbyBjYW4ndCBiZSB1c2Vk
IHJlbGlhYmx5LiAgSGFzd2VsbAp1c2VzIHRoZSBzYW1lIGdlbmVyYXRpb24gb2YgZGlzcGxheSBh
dWRpbyBidXQgc3RpbGwgZGVmYXVsdHMgdG8gUE9TQlVGCnZpYSBQT1NfRklYX0FVVE8uCgpPbiBh
IERlbGwgTGF0aXR1ZGUgRTc0NDAgKEhhc3dlbGwtVUxULCBjb250cm9sbGVyIDgwODY6MGEwYykg
ZHJpdmluZyBhClNhbXN1bmcgVFYgb3ZlciBIRE1JIGF0IDE5MjB4MTA4MEA2MCwgdGhlIHBvc2l0
aW9uIHJlcG9ydGVkIHRocm91Z2ggdGhlCnBvc2l0aW9uIGJ1ZmZlciBhZHZhbmNlcyBmYXN0ZXIg
dGhhbiBDTE9DS19NT05PVE9OSUM6ICswLjQ0JSB0byArMC45NyUKYWNyb3NzIHNldmVyYWwgMTUw
IHMgcnVucyBhdCAxOTIweDEwODBANjAgYW5kICsyMy44JSBhdCAxMjgweDcyMEA2MCwKd2l0aCBk
aXNjcmV0ZSBmb3J3YXJkIGp1bXBzIG9mIGh1bmRyZWRzIHRvIHRob3VzYW5kcyBvZiBmcmFtZXMu
ICBXaXRoCnBvc2l0aW9uX2ZpeD0xIChMUElCKSB0aGUgc2FtZSBtZWFzdXJlbWVudCBnaXZlcyAt
MzAuNSBwcG0gd2l0aCBubwpqdW1wcyBvdmVyIDE1MCBzOyB0aGUgYW5hbG9nIGNvZGVjIG9uIHRo
ZSBzYW1lIHBsYXRmb3JtIG1lYXN1cmVzCi0zNCBwcG0gd2l0aCBlaXRoZXIgc2V0dGluZy4KClVz
ZXJzcGFjZSB0aGF0IGNsb2NrcyBwbGF5YmFjayBmcm9tIHRoZSBkZXZpY2UgcG9zaXRpb24gKGUu
Zy4gUGlwZVdpcmUpCmNvbnNlcXVlbnRseSBwdXNoZXMgZGF0YSBmYXN0ZXIgdGhhbiB0aGUgaGFy
ZHdhcmUgY29uc3VtZXMgaXQuICBUaGUKcmVhbCBETUEgYnVmZmVyIG92ZXJydW5zIHBlcmlvZGlj
YWxseSAoZXZlcnkgfjEzMCBzKSwgY2F1c2luZyBhdWRpYmxlCmdsaXRjaGVzIGFuZCBBL1YgZGVz
eW5jaHJvbml6YXRpb24gb3ZlciBIRE1JLgoKRm9yY2UgdGhlIExQSUIgcG9zaXRpb24gZml4IG9u
IEhhc3dlbGwsIGFzIGFscmVhZHkgZG9uZSBmb3IgQnJvYWR3ZWxsLgoKVGVzdGVkLWJ5OiBFdmdl
bml5IFNoaXNoa2luIDxldnNoaXNoQGdtYWlsLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKU2lnbmVkLW9mZi1ieTogRXZnZW5peSBTaGlzaGtpbiA8ZXZzaGlzaEBnbWFpbC5jb20+Ci0t
LQogc291bmQvaGRhL2NvbnRyb2xsZXJzL2ludGVsLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9j
b250cm9sbGVycy9pbnRlbC5jIGIvc291bmQvaGRhL2NvbnRyb2xsZXJzL2ludGVsLmMKaW5kZXgg
MjQwMTVjNy4uZmJiZWI0OSAxMDA2NDQKLS0tIGEvc291bmQvaGRhL2NvbnRyb2xsZXJzL2ludGVs
LmMKKysrIGIvc291bmQvaGRhL2NvbnRyb2xsZXJzL2ludGVsLmMKQEAgLTI3Miw3ICsyNzIsOCBA
QCBlbnVtIHsKIAogLyogSFNXIEhETUkgKi8KICNkZWZpbmUgQVpYX0RDQVBTX0lOVEVMX0hBU1dF
TEwgXAotCSgvKkFaWF9EQ0FQU19BTElHTl9CVUZTSVpFIHwqLyBBWlhfRENBUFNfQ09VTlRfTFBJ
Ql9ERUxBWSB8XAorCSgvKkFaWF9EQ0FQU19BTElHTl9CVUZTSVpFIHwqLyBBWlhfRENBUFNfUE9T
RklYX0xQSUIgfFwKKwkgQVpYX0RDQVBTX0NPVU5UX0xQSUJfREVMQVkgfFwKIAkgQVpYX0RDQVBT
X1BNX1JVTlRJTUUgfCBBWlhfRENBUFNfSTkxNV9DT01QT05FTlQgfFwKIAkgQVpYX0RDQVBTX1NO
T09QX1RZUEUoU0NIKSkKIAotLSAKMi41NS4wCgo=
--00000000000004e619065d14b659--
