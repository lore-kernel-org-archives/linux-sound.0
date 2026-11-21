Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795281903;
	b=EYTtNkapHkqRm8Gw5Yk33yTBkXQ+Yh+E7a2xsxXMz86KyG0yxugTuUt2MrBjvcyV+mTG
	 fTPJz473DpoAcrHMpx0cJXh/++dZ/IufG5l7ELhCUhW9q3gU28Q3iZMqwOQIJzDeKlGAF
	 6qWUDlkDV9WLMPbY9YwuwWIuqCsvwef807imXMalLbQ4FtaruM0i+Tc29qMDNTBB49xiu
	 opii0FTNGOSkyAsN+SBaNw3kPXgUbmRuh09G5h5rZww2Rw9XVFynvv0WpVsyMXITNKUDk
	 f8tZg7wVTMgRsKxQN0WFSLeaz4H60vWHAr+KaWjoEWJ6z4RQQr4U1USXrAxkHi6dmKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=JCtH1NAeUC8PDgGkI7aBz7U+Ki2zRpiZyYVsYZXvsB4=;
	b=TKGyA24vV/FjZWyyFoQ9IwZsQK+/dLzEBjHAkONFXJr0p6yVshM00xQzLxvtw5HyENH7
	 flskWqEzW1Shk6iXspRjBA3q1r3PQkknDNP4yksWp25Svcyr0AOE6DXCM/r1Qc5CnUacd
	 05F0YxoXbMJQAXRsPBx6ZDQxu45s5T+EK4qFFGnYr45aqL18aakDLsu2pXcdpUHvWUNn8
	 vdtN0eZdRQXA3i1FkcyoOpRq0Soz+QtjH5PpZZYJ7aSeEXQxD5O0cAlp5rZL/nfCdP4Xj
	 WMx8fBWguwW3+8Gvu1mnyQ6BL147/edmuu4/1HTXUEPXmoznd3ddrekC2jqFs3qiQkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsCaVZO0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.228.72
Received: from mail-ed2-f8.google.com (mail-ed2-f8.google.com [74.125.228.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF60606A32A
	for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 17:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF60606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KsCaVZO0
Received: by mail-ed2-f8.google.com with SMTP id 4fb4d7f45d1cf-6ba0b4ecc0cso665494a12.1
        for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 09:25:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795281901; cv=none;
        d=google.com; s=arc-20260327;
        b=dDV4XE1cRd/VoHJ1mPz1oUWKWCjSBukBR18tYk/Ut4PCkZCSmUI46GRh/UH4s2Pg2f
         how3PTfbt2JA85rQuI4m2T8IpHQVqlGiWXJG+0cg6J7MYhFNopRnHmFDE/zLYzHMoymY
         9r4u1QRw6ltLfvk7ln95WpcHHUuQjrt23L/k3bvqGXi9qyLNxOSs8MWnZ5N+UtlQs6nf
         S8ZiNWYUNTrswLnu9MApEHgDG22j9ted2t1oWVCAr0rxLsj68TXoUzk8mDQGRumvcIxK
         uNYxJhR/ppnEhujCsFKLtRQUeHAymPQzMzGjZGzq17PjVrqU2NqW97uRtjpgpLaWNRuA
         A4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JCtH1NAeUC8PDgGkI7aBz7U+Ki2zRpiZyYVsYZXvsB4=;
        fh=H6NwC/IKQAHYIvINJcK4IWXTNWPCOopIjvDXGD+oims=;
        b=V9d64Oxx83LZ+PmwcV9CIWItmKiKa7DACE8LCjH9tLfQ7xdlpa9XUAK5ctn6zUHXP9
         QcwHvqTIas3pPY/OeUi0pFe1bFsf2xirM1qt6sK67BAFkM0iHt7LbxfIunGe7r/2CD9v
         mL5CLFfSbgfVVYV+rY/SRQ0In9pAme6ZVqrfiCl3KrJHlarHIxiZYQos/Q9mnmtSrr5K
         JFACrz10MOLn7B2ipT0pvhPKb9t+qw/m/4mmjc0NXpTDBmNn88XsKR++ll52zlvLmXRT
         iI1Gz5TwJkQoQYhss/q5cVoi6uAsCRup4to74k6DWEUPkelYZFPFT4oS4drGg0E5NJt8
         7+1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281901; x=1795886701; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCtH1NAeUC8PDgGkI7aBz7U+Ki2zRpiZyYVsYZXvsB4=;
        b=KsCaVZO0hyv3t7t4rj9NLAWuwud5lr4fXkcf31Il+MaNs03yo6xbaWyzB/cuAPcfAY
         hWM9+9p/qT8sAv8jkps2GUSug/gSdxYxxmPY9GYebOJnGGmWseBCP8awJO/9JFM2bJnZ
         ZmAEYeAz0LAUCoYZ8wGxJ9+M5vI5XascIo+7oR6UoWfqWCxDMnWn5nj6xoyM1F0yblZN
         ooxtV91NyXSfthkOZwSJ7lgky2Ku18XwfJO1rUH6gIndO2SeRDvAxca7KJ8HckDlTtay
         Y7sQp+kpyuNX/7/x4iKPzzsc0NwC/mbfCAwXfrCGXi5oxn+a5dKF6oVexq6MrSECuHLA
         C0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281901; x=1795886701;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JCtH1NAeUC8PDgGkI7aBz7U+Ki2zRpiZyYVsYZXvsB4=;
        b=bhGYBIl4n/tjLYLpPxEJF378RRjHJ2qch8QS+5yvN5ekpgS2fUDGcODlBBct1NFLsg
         VQzrZtIXCHlfaKdyTDcqOTGNqDOaYpjjagELgPXdHpHDxwfJkQYzxN/77AaWZe9/i79d
         lFcO1aCesq2iaAO3TJpjU6QxfbZ0xK+ehBLdsvQfiCEKRMrtgfb+cqk9F0Vfn5Qf3Aej
         J51A1Cf8ArZyQFfaNeLKngDGvBCZa215QRPy5v8OpGYdEBRrY3FHSHZuJc1xVy8mGsuL
         xF/zxOek9w/pvnRqqpWP+1u/LPh+fqjfobQf1pe/k35lxzBBkDZNWpZWPcgQsllvTndr
         iLmg==
X-Gm-Message-State: APuU4Z+Gi2F7vayjS9kprOrmSLiVtqM1xWIYP4r18iZBgVRfjN26HVch
	saHNWdREe5SIG+PspM0vuquPOaCnMi7WSxSCGM0VttT+gAe0nRkInpT8yNGM3gxPyyHoiAou6z3
	Qo4Mz7ZFYxBNt8bKbyvUsX9PoMzGMkPF79agHo7luc5ZY
X-Gm-Gg: AZFdTZee9fEGmhAKX1HfHKI9ohmPGqxT9IrLNS37t8vfVc+Bl2ci7HDONbFgy5idNQ+
	bOYcAp17kSMhjoH1cQss23lQfWzp0s6hkDDBmNb7fuY182XLYd+U3urQnVEP4aie4vrOQDwqhzF
	V9DrZCJgU+Eel84eKjvCFti58z0gp/rUmIohr/u1WJSKCkWSXGW+4EpJZ8dqXVI4tqrg0gu3XA/
	KL0AdhU8Xc93HxKZRWAQ4gTAXCwA9/+QHml/xWVmxsacQXo/71K0gG3S9YeaW9RuxJGTx8zLrJi
	KfGQTvuxjSIdyh6eUDcPgTVbOdIzJ863xw7XlmCJzjTjzYS3yUehW/iN1GuE6EgO/pXtrNYn70P
	FgiMheLLB6RyyqnmwlgfMKn395/4N6TZIug1z/yZIG8Quv0CriBPNPS+hxogxrebgOR9nJ+NL5l
	ksXzKYLzMHqhm13yh9Tq1UKGFWCplC0vHGYXtypLM97I3RbCyt7osawg==
X-Received: by 2002:aa7:df05:0:b0:6b6:eefc:ae7a with SMTP id
 4fb4d7f45d1cf-6ba37c7b05emr3499352a12.4.1795281901195; Sat, 21 Nov 2026
 09:25:01 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Cristian-Marian Fotache <cristianmarianfotache@gmail.com>
Date: Sat, 21 Nov 2026 18:24:47 +0100
X-Gm-Features: Aa3M54r1WQ9QYMX58sNtqVV1NoX8RoAihWmhYpBtIOPrj8qXsUyEYluUqKamgqg
Message-ID: <CACGjpbf73XdwrG34ffjmYU3ZYuStPpFNXf9w+AGYcTmLyHCN_w@mail.gmail.com>
Subject: [REGRESSION] ALSA: hda/realtek: Higole F9B fixup breaks speakers on
 unrelated Apollo Lake laptop (10ec:111e)
To: tiwai@suse.com, perex@perex.cz
Cc: linux-sound@vger.kernel.org, asas1asas200@gmail.com, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000fe58e80660cca3fa"

--000000000000fe58e80660cca3fa
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to report an internal speaker regression affecting an
Intel Apollo Lake laptop with a Realtek ALC269VC codec.

The regression appears to be related to the following upstream commit:

2a8ee6897302ca12ff39e8eb180503956797c60c
ALSA: hda/realtek: Fix silent speaker on Higole F9B

Original patch:
https://patch.msgid.link/20260923141344.1543158-1-asas1asas200@gmail.com

Affected hardware

CPU: Intel Celeron J3455 (Apollo Lake)

PCI audio controller: 8086:5a98

PCI subsystem ID: 10ec:111e

Codec: Realtek ALC269VC

Codec vendor ID: 0x10ec0269

Codec subsystem ID: 0x10ec111e

Codec revision: 0x100202

DMI baseboard product: SCHNEIDER

BIOS: American Megatrends AN12DV201 (2021-01-25)

Distribution: Linux Mint Xfce

This laptop is not a Higole F9B, but shares its subsystem identifier.

Regression testing

6.14.0-37-generic: internal speakers work.

7.0.0-43-generic (#43~24.04.1-Ubuntu): internal speakers are silent.

7.0.0-43-generic with snd_hda_intel.model=nofixup: internal speakers work again.

The workaround has also been verified across a reboot.

Diagnostic findings

The affected kernel reports:

ALC269VC: picked fixup  for PCI SSID 10ec:111e

Comparing the complete codec dumps from the working and affected
kernels reveals changes to the connection configurations of nodes 0x14
and 0x15.

For speaker pin 0x14, the working kernel reports:

Connection: 2
  0x0c 0x0d*

The affected kernel reports:

Connection: 2
  0x0c* 0x0d
In-driver Connection: 1
  0x0c

Node 0x15 also receives the restricted in-driver connection list.

The captured ALSA mixer configurations from the working and affected
kernels are byte-for-byte identical.

When booting with snd_hda_intel.model=nofixup, the kernel reports:

ALC269VC: picked no fixup (nofixup specified)

The original connection topology is restored, and the internal
speakers produce sound again.

Suspected cause

The subsystem-ID-based Higole F9B quirk appears to match unrelated
hardware that requires a different audio routing configuration.

A more restrictive hardware match may be needed to preserve the
original Higole F9B fix without introducing a regression on other
devices sharing subsystem ID 10ec:111e.

I have not performed a full kernel bisection or independently tested
the suspected commit in an upstream kernel build.

Comparative codec dumps, mixer configurations, kernel logs, PCI
information and DMI information are included in the attached
diagnostic archive. A separate unified codec diff is also attached.

I would be happy to provide additional diagnostics, test proposed
patches, or assist in developing a correction that preserves
functionality on both machines.

The investigation and preparation of this report were assisted by an
LLM. All physical hardware testing and diagnostic captures were
performed directly on the affected machine.

Thank you for your time.

Best regards,
Cristian-Marian Fotache

--000000000000fe58e80660cca3fa
Content-Type: application/gzip; name="phoenix-audio-debug-public.tar.gz"
Content-Disposition: attachment; 
	filename="phoenix-audio-debug-public.tar.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_mwqogxma0>
X-Attachment-Id: f_mwqogxma0

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
vXm2Y4OsW6su6IX2b+3L39tJN8f0jSNzuP0xtp0xheKmkPwP6mN9r82fuSOWn/F8sJcMk2Rb1tqC
NHuuwXyfZz5EiqjPHGvo8MXeMVw2GFTUwgz6fjvbhHzPIMe+kaiEEarC7ghVFC7lu/szbqjvhRub
wj97cCCfgAMyz/vHzv8+9NMfz+d/g8O4mv+taHmZ/y3zv2X+t8z/lvnfMv/7XeZ/6zyFRCcy/1vm
f8v8b5n/LfO/Zf63zP+W+d8y/1vmf8v8b5n/LfO/Zf63zP+W+d8vSJmQud0yt/tgmREyb1vmbcu8
bZm3LfO2Zd62zNuWedsyb1vmbcu8bZm3LfO2Zd62zNuWedsyb1vmbcu8bZn/vZr//c31HkDVHO39
/xvzvzVSkPnfMv9b5n/L/G+Z/y3zv+X7v2X+t8z/lvnfMv9b5n/L/G+Z/y3zv2X+t8z/lvnfMv9b
5n/L/G+Z/y3zv2X+t8z/lvnfMv9b5n/L/G+Z/y3zv2X+t8z/lvnfMv9b5n/L/G+Z/y3zv2X+t8z/
lvnfMv9b5n/LY1v+tzmyDvre72T534oKS9RK/jfWoLrM/z7C8QuCUTcZT/1HalZPnUdrIeq1TpuX
PZHciwaeO0L+kz/ws6m4XM0qWQWNPeYzJ8imUl+oY9ostibSqN5qipwqBOdEQ/0nWIJTomHTidJf
QC2lTqKFqgwqkHmWQR3UYkMaeFDqQ0Ujy2t4vtBg1TYm9a9EwamTLrMZ9Rmqw8IOJgHOET1HFAJ3
5knrkzNOCNQNncAaMdQDxQtqUEMPp1B42YoLdNSC69o99WDdBxp4VrNfTp2cdGpNZPnID8dj1wML
A4oE+VAWjoceNRm3M6al/j013W+cbXCf2jaYFaKF6wYR82r1VWhRehEHgvq82iZknE5e7hoPLCpu
1NcA6Vmi/5zDWQJdQQPbHY+fwKDx+J4B0OKxeWX00QJ3F6v3n6AZjPXPuQLYIg8vbkWyxeLLkHU8
fuEbPMYyrb/Uj6i2Lir3YByovRusNgfLTbxdVQuiarXWWRvQ694pskHgjKeN3BfD4o+ZYQ1ANoXd
ulLtinpDPjDIcIEOQGaCAHlWP9xU+bpxtkpBNMjx8xDgLGVBhM8sb/SN92NejrPq8gTDCxMMzkkh
nmC9+IGLxSnWok444Eatxy3dqV3PyXSGKeCga4YGODp0xNbvzibf6o14iNrhqM+h3njM5PPHvE2d
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
je30CghpEclDHvKQhzw2Hv8PaRod4QAYAQA=
--000000000000fe58e80660cca3fa
Content-Type: text/x-patch; charset="US-ASCII"; name="phoenix-codec-routing.diff"
Content-Disposition: attachment; filename="phoenix-codec-routing.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mwqogxq01>
X-Attachment-Id: f_mwqogxq01

LS0tIGNvZGVjLXdvcmtpbmcudHh0CisrKyBjb2RlYy1icm9rZW4udHh0CkBAIC0xNDYsNyArMTQ2
LDkgQEAKICAgUG93ZXIgc3RhdGVzOiAgRDAgRDEgRDIgRDMgRVBTUwogICBQb3dlcjogc2V0dGlu
Zz1EMCwgYWN0dWFsPUQwCiAgIENvbm5lY3Rpb246IDIKLSAgICAgMHgwYyAweDBkKgorICAgICAw
eDBjKiAweDBkCisgIEluLWRyaXZlciBDb25uZWN0aW9uOiAxCisgICAgIDB4MGMKIE5vZGUgMHgx
NSBbUGluIENvbXBsZXhdIHdjYXBzIDB4NDAwNThkOiBTdGVyZW8gQW1wLU91dAogICBDb250cm9s
OiBuYW1lPSJIZWFkcGhvbmUgUGxheWJhY2sgU3dpdGNoIiwgaW5kZXg9MCwgZGV2aWNlPTAKICAg
ICBDb250cm9sQW1wOiBjaHM9MywgZGlyPU91dCwgaWR4PTAsIG9mcz0wCkBAIC0xNjMsNiArMTY1
LDggQEAKICAgUG93ZXI6IHNldHRpbmc9RDAsIGFjdHVhbD1EMAogICBDb25uZWN0aW9uOiAyCiAg
ICAgIDB4MGMqIDB4MGQKKyAgSW4tZHJpdmVyIENvbm5lY3Rpb246IDEKKyAgICAgMHgwYwogTm9k
ZSAweDE2IFtWZW5kb3IgRGVmaW5lZCBXaWRnZXRdIHdjYXBzIDB4ZjAwMDAwOiBNb25vCiBOb2Rl
IDB4MTcgW1BpbiBDb21wbGV4XSB3Y2FwcyAweDQwMDUwYzogTW9ubyBBbXAtT3V0CiAgIEFtcC1P
dXQgY2Fwczogb2ZzPTB4MDAsIG5zdGVwcz0weDAwLCBzdGVwc2l6ZT0weDAwLCBtdXRlPTEK
--000000000000fe58e80660cca3fa--
