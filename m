Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261649;
	b=onVu0tQbRzdgrQGITRCmgA1HLrxm2KF+a+VsdEFnpm/i0HjnRzinZ2X/ru5vtff1GO7s
	 oZNI7zh0ntD+1Tf1A6V8CE1jJjCeT63kVuLXt/PcvdhmZmrXP1vZgHQL8FGy/17Re3yd+
	 hUMiiFBrlsxSLshoFcLQHhMKKzXjnt28Mty3fYsvzJfx1x+xQLVkP/aBKcqBH7bK2Vvnw
	 j+V0rC45KJf/LHwfCwpUC/1LQD0faCOHvq+TsIwazXkTp7fu0w7WGF4iUjTMAnaLy1doz
	 Ng/XAae4oVx5XYPJtP32lUbPvJ9AqOSI7z6ay25B53CvmnBTSHDPmPi1kGnt2fxc77w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=JH2ealK10nsMlo+8ig3QAlmaLezl4DUTELczpwSTT6g=;
	b=wN696w6ryuWAStxuNpE1M4wevLhS802TR79ORNtfUois2xwxdOfFSTp1J47TEVJ7knGZ
	 57wF5ERivxe19nj9sAt6wCF577rvYrYnz1w9XLWpx8unwYo06lyE8BhWzZnRgxRagmSU4
	 URcdBI0hxJhAwSjIUsPuTO7WzwI7vziD5CfOLHsS2Y2091+tL55r3MAz1NhCwNrx8b5Uw
	 h5Vr+1fkUcqyMH9m4cGNqKnhFHfjdreaHMnncIy88WO3i8NvoAQkT/B4XM2/P+DM0IohS
	 Vc50Bgdww4FfkH1SGHl2GPOmjNRuXnmVIY2SoENeQwORBIVhx3dBbHvYQOz9FhunJkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dCYEE8vY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FD606A336
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9FD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dCYEE8vY
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-369f3e9e431so409133eec.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261648; cv=none;
        d=google.com; s=arc-20260327;
        b=LlaZ1ZzV2SyPy6rKFbf/+MGohj6+O1JP7gdTRUvMaCMGRpcNedJxZhuuo3EAEiByGQ
         VIR+RgkJhx5VVANeOoyyYnBgL7SkSNi4C+5UUPDwqdw7KBRhosSy5g3dRmRyuye+P4eQ
         OoNZBCvZcfJMe0gG8U07uux/gEH8j8mk6Am21JKG3FnxVtkOUx6s14ZfJ7iO5rRBt8bo
         SNFpcHsU+pDe0QvDILw2g0N8VVOg1NQCVrBSsUp7U1O0dWbQihqSTEENtiFdvY6LKzHg
         DgRoxi36fa5c+gU33O7jC3wB2mtCa77YBoQRyhNVFZ5efxgt9IHIxl8xdU44zeYUTr04
         mpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JH2ealK10nsMlo+8ig3QAlmaLezl4DUTELczpwSTT6g=;
        fh=hjeHATIVOdE0TMlJT+GFuOOJW9eDxHBgN8Ge0FnkVh4=;
        b=kenM7QffH+dMfpw3tMW/ATohHu8R7A2NePYKHtHRcTE1PMetANf5QDthG58fNepeih
         +I0ArPAtCXEAbk3FX/LCzNEG/uTN41n+ohePu7Oc/UxlBvyiKCxQWIJgEG+XX0dP0+Hp
         tTAqImHy4SAeK19FDJJdDdIcETpHxxOxOlUMnAuGTbZTgO1ymJeg0FwrikQQRB+0l89k
         zhvTSsFMMdO6lKL595tQJLslx3pg9M/wRqWWsAa+KASX+OMEPwvPEeoW+j+taEf5TJaG
         gFSV2FXYTxHYLeSpMBtF1DbKCMKaHoP1aUBhYY0Txcu6w2DW3rqzJ783BA30l4VDcVVV
         Bezw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261648; x=1793866448; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JH2ealK10nsMlo+8ig3QAlmaLezl4DUTELczpwSTT6g=;
        b=dCYEE8vY3/N1pIKafCcXfiTYgBW6FkC9OgxSnF8Kp7gtCLgRsSto7FE+G7rop1Irs/
         pSzoT0pRzMjEGc/mT/k0XZb3Io5xt/oCTBsY6ZObfaYAgQeSbCzeMQIRWCnBoNFF4kRI
         A14Q/IBHsNAhpAWjYh5oyufoji2+BneVpQvqSBwm81zfxyUwMHRkiXKGIPobsB1cgNdq
         uvX3Br5I7wIY7SceO7p3j1/BJo+Ec/YzJAffybJWDHwl83usV1PqQBmv9CFvqbcJI04M
         N5nNbm08Dyx4EU3v7ADWBtICGkkDorfFHuCoSmj3esu7GmqAazWFdUKO5XtSGGr2RMr+
         ntEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261648; x=1793866448;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JH2ealK10nsMlo+8ig3QAlmaLezl4DUTELczpwSTT6g=;
        b=wpoc6R2ZCLiQ9zjlR2MW2Kvt4qUtf42DInrDQZh7Ad5RVZwjz0J6nHid6hrNhvTD/k
         9PjbSl3Qt5e1ae2kqkl23baQ6hgdZiSVWlNuNjEcDee4jKqrqsN2QRd2FLNC0Te06G2r
         pZhStqmTH5BFS/dLwg9OxWdmGlZyi1OgX5KMKjlHW3a/V4fo9VJntvZI3QOEqY78jrun
         oT3Q1KBGyyFZoEyPPBwtI2F46bbsZtfjndqIV2eFg1BOMrYXqTztfdEkX7TyoV+UurNM
         yjcjLYGzDuSwhT4lDpW9UVn4UOQTKx1xFD+h/teVB5XWVfDjzqUP9l+PSzK4p3t0pjBf
         GGjA==
X-Gm-Message-State: AFq9FYJ5KV8Pkio2avtZOgiwf/NifwetbQOm7xi54yQBVgkBmSU7M2pg
	0kY2rHosUn3AQe5CvUhMtZnhAti8gjw6a061Zg0CbqFi0Hx1yj8JQg/MSw8GzZqtdqBizxM9vYn
	LCg6ssAkyeTjU/SOXCBLJew1kzriMvIA=
X-Gm-Gg: AYBFou2adOHT7mj6ZeM91taYSWUX8DxtqOQKnT+Y5IMjqgfoN6awN/MT+yXSA9xnAsn
	EyqI+eo8zMN1gObX/+u6JU2IvXmg3fzMstunN4nzHPZB5bN5Qdfo+pmzbm4orgW5kC/lxVP8tXQ
	O/r+soLTzYN/bQo0LFhMdyxuDHq6jzPgupWnPnUcAr7S9h8pevKNIBnu9mnd0NdSHlbQjiKTVXl
	ipvpn6k1tR2Es66d6VaPJQcpJ/mYo2CSZEeBZ9RJ6LCW0GJb+5Ak7xOxXHaXA7n10OEkzlPDu4s
	aiP5A4pHBSDcBM7uHvtX44KaJ+tMaXt+N/DraM4crNsSxA89LwKU9BJQpXC+qO9Z1pWhLQcgxx7
	pArnQWQgGnV9vszDnw5aA7rFq4alWFUB9gwy7fQ==
X-Received: by 2002:a05:7300:3d0a:b0:35e:2c6:d462 with SMTP id
 5a478bee46e88-36a2fc203c3mr2374780eec.0.1793261647933; Thu, 29 Oct 2026
 01:14:07 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Guobing Yin <yinguobing@gmail.com>
Date: Thu, 29 Oct 2026 16:13:31 +0800
X-Gm-Features: AclHuK-PnB7mO8KSJiKwnX23cUBn0U0rPfKJfxxPFV0eK4XBA91ytNFS7HyOggc
Message-ID: <CA+2LKoO7He4DciWnx7qcwndwpZNxA4R1FMTpXGSTVK_k9J6Svg@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Huawei WRT-WX9 (ALC256, 19e5:320d)
To: alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org, tiwai@suse.de, perex@perex.cz
Content-Type: multipart/mixed; boundary="0000000000008433c3065ef6433f"

--0000000000008433c3065ef6433f
Content-Type: text/plain; charset="UTF-8"

Hi,

this is a one-line quirk addition for a Huawei MateBook WRT-WX9 whose
Realtek ALC256 codec reports subsystem ID 19e5:320d.  The patch is
attached.

Problem: headphone insertion is never detected.  The "Headphone Jack"
control stays off, PipeWire keeps the speaker route selected, and audio
comes out of the internal speakers and the headphones at the same time.
Unplugging the headphones leaves the speakers working, so only insertion
detection is broken.

Cause: the existing quirk for this machine family is registered for
19e5:320f only, so this variant receives no fixup at all.  Applying
ALC269_FIXUP_HEADSET_MODE makes jack detection work.

Evidence from the affected machine (kernel 7.0.0-38-generic):

  lspci -nn:
    00:1f.3 Audio device [0403]: Intel Corporation Cannon Point-LP
    High Definition Audio Controller [8086:9dc8] (rev 30)

  codec:  Realtek ALC256, vendor 0x10ec0256, subsystem 0x19e5320d
  DMI:    HUAWEI WRT-WX9 / WRT-WX9-PCB, BIOS 1.39

  Without the fixup:
    $ amixer -c0 cget numid=12 | tail -1
      : values=off            # headphones are plugged in
    $ hda-verb /dev/snd/hwC0D0 0x21 0x0f09 0x0
      value = 0x0             # pin sense never reports presence
    PipeWire: analog-output-headphones -> "not available"

  Booting with snd-hda-intel.model=headset-mode (the same
  ALC269_FIXUP_HEADSET_MODE fixup):
    $ amixer -c0 cget numid=12 | tail -1
      : values=on
    $ hda-verb /dev/snd/hwC0D0 0x21 0x0f09 0x0
      value = 0x80000000
    PipeWire: analog-output-headphones -> "available"; the speaker is
    muted automatically on insertion and unplugging restores speaker
    output.

  HDMI audio profiles and the internal microphone keep working with the
  fixup applied.

The attached patch just maps 19e5:320d to that fixup.

I am not subscribed to the list, please keep me in Cc.

Thanks,
yinguobing <yinguobing@gmail.com>

--0000000000008433c3065ef6433f
Content-Type: text/x-patch; charset="US-ASCII"; name="huawei-wrt-wx9-alc256-quirk.patch"
Content-Disposition: attachment; 
	filename="huawei-wrt-wx9-alc256-quirk.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvt9lqxp0>
X-Attachment-Id: f_mvt9lqxp0

RnJvbTogeWluZ3VvYmluZyA8eWluZ3VvYmluZ0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjkgT2N0
IDIwMjYgMTY6MDg6MDAgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNBOiBoZGEvcmVhbHRlazog
QWRkIHF1aXJrIGZvciBIdWF3ZWkgV1JULVdYOSAoQUxDMjU2LCAxOWU1OjMyMGQpCgpPbiB0aGUg
SHVhd2VpIE1hdGVCb29rIFdSVC1XWDkgd2hvc2UgQUxDMjU2IGNvZGVjIHJlcG9ydHMgc3Vic3lz
dGVtIElECjE5ZTU6MzIwZCwgaGVhZHBob25lIGphY2sgcHJlc2VuY2UgZGV0ZWN0aW9uIG5ldmVy
IHdvcmtzOiB0aGUKIkhlYWRwaG9uZSBKYWNrIiBjb250cm9sIHN0YXlzIG9mZiwgUGlwZVdpcmUg
a2VlcHMgdGhlIHNwZWFrZXIgcm91dGUKYWN0aXZlLCBhbmQgYXVkaW8gcGxheXMgZnJvbSB0aGUg
aW50ZXJuYWwgc3BlYWtlcnMgYW5kIHRoZSBoZWFkcGhvbmVzIGF0CnRoZSBzYW1lIHRpbWUuICBV
bnBsdWdnaW5nIHRoZSBoZWFkcGhvbmVzIGxlYXZlcyB0aGUgc3BlYWtlcnMgd29ya2luZywgc28K
b25seSBpbnNlcnRpb24gZGV0ZWN0aW9uIGlzIGJyb2tlbi4KClRoZSBleGlzdGluZyBxdWlyayBm
b3IgdGhpcyBtYWNoaW5lIGZhbWlseSBpcyByZWdpc3RlcmVkIGZvciAxOWU1OjMyMGYKb25seSwg
c28gdGhpcyB2YXJpYW50IHJlY2VpdmVzIG5vIGZpeHVwIGF0IGFsbC4gIEFMQzI1NiBvbiB0aGlz
IGJvYXJkCm5lZWRzIEFMQzI2OV9GSVhVUF9IRUFEU0VUX01PREU7IHdpdGhvdXQgaXQgdGhlIGNv
ZGVjJ3MgamFjayBkZXRlY3Rpb24gaXMKbmV2ZXIgZW5hYmxlZCBhbmQgR0VUX1BJTl9TRU5TRSBv
biB0aGUgaGVhZHBob25lIHBpbiAoMHgyMSkgYWx3YXlzIHJlYWRzIDAuCgpWZXJpZmllZCBvbiB0
aGUgYWZmZWN0ZWQgbWFjaGluZSBieSBib290aW5nIHdpdGgKc25kLWhkYS1pbnRlbC5tb2RlbD1o
ZWFkc2V0LW1vZGUsIHdoaWNoIGFwcGxpZXMgdGhlIHNhbWUgZml4dXA6IHRoZQoiSGVhZHBob25l
IEphY2siIGNvbnRyb2wgdGhlbiByZXBvcnRzICJvbiIgd2hlbiBhIHBsdWcgaXMgaW5zZXJ0ZWQs
CkdFVF9QSU5fU0VOU0Ugb24gcGluIDB4MjEgcmV0dXJucyAweDgwMDAwMDAwLCB0aGUgIkhlYWRw
aG9uZXMiIHBvcnQKYmVjb21lcyBhdmFpbGFibGUgaW4gUGlwZVdpcmUsIGFuZCB0aGUgc3BlYWtl
ciBpcyBtdXRlZCBhdXRvbWF0aWNhbGx5IG9uCmluc2VydGlvbi4gIEhETUkgYXVkaW8gcHJvZmls
ZXMgYW5kIHRoZSBpbnRlcm5hbCBtaWNyb3Bob25lIGtlZXAgd29ya2luZy4KCkFkZCBhIFNORF9Q
Q0lfUVVJUksgZW50cnkgZm9yIDE5ZTU6MzIwZCB1c2luZyBBTEMyNjlfRklYVVBfSEVBRFNFVF9N
T0RFLgoKU2lnbmVkLW9mZi1ieTogeWluZ3VvYmluZyA8eWluZ3VvYmluZ0BnbWFpbC5jb20+Ci0t
LQogc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jIHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsv
YWxjMjY5LmMgYi9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMKLS0tIGEvc291bmQv
aGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCisrKyBiL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRl
ay9hbGMyNjkuYwpAQCAtODU2MCwzICs4NTYwLDQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFf
cXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxOWU1LCAweDMy
MDQsICJIdWF3ZWkgTUFDSC1XWDkiLCBBTEMyNTZfRklYVVBfSFVBV0VJX01BQ0hfV1g5X1BJTlMp
LAorCVNORF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyMGQsICJIdWF3ZWkgV1JULVdYOSIsIEFMQzI2
OV9GSVhVUF9IRUFEU0VUX01PREUpLAogCVNORF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyMGYsICJI
dWF3ZWkgV1JULVdYOSAiLCBBTEMyNTZfRklYVVBfQVNVU19NSUNfTk9fUFJFU0VOQ0UpLAogCVNO
RF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyMTIsICJIdWF3ZWkgS0xWLVdYOSAiLCBBTEMyNTZfRklY
VVBfQUNFUl9IRUFEU0VUX01JQyksCi0tIAoyLjQzLjAK
--0000000000008433c3065ef6433f--
