Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5AF35C687
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785885371; cv=pass; b=Nk4ksBA7h30ePLRSXCCR/p2AaFroHt2ugRIIea7NXz277BFCXQxRAXcVXdVxh8ssKlI1JisQIs2biFXmygms45EI74ce+xZAGrziQRRyrPxP9IlmNFJRVajCKLpbYQ2BE46ZtMiExcAkiwFTQ/gUjS7NYaPqD/431NcNKG8g9N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785885371; c=relaxed/simple;
	bh=A8npEZNmBstqfidfrhI5j2Vn8uVvTgrWaiDnZQTm0AA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=E/iBefvlwp90kS7XMCv+WEKVaZ0ev9beUnqB2QUXwiHGBOXEi2est20l+upYQxyhTtFU0vUZahOCEPmMknvYn7DwSElqpXlVgZtxSOm1eeazac4/dpoCPrEHlGpaRPZlSGhfhUkovs0np2Cihwx5Fv0S6Gnw8/rnsqG9Cx9fICg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jybEwZTb; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jybEwZTb"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so208434a12.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 16:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785885368; cv=none;
        d=google.com; s=arc-20260327;
        b=sgH7uTdZ+dOg7V+G6By+sOE9uLQAP6w3HU+GT4DEWdc6eVSiJzvPkA8LwiiNIhjIYc
         Dcevd87iRC3dkPjknQofMYcRn40hk+k1auVPiDoGljgbhIcTQb+lPmE6rMn4yaeN+aia
         9EIHYoP2dOLjnkNTi4fRq4BUTyNB8yEa/DDrTa8ICcLYwpHO+fAQR5MCmTE+r2PWMQhB
         Ppsn5oTvjvtmPfgjQCQSVeU7SzwxqAUFFOTiNi8No5CWaNHYhW2qR0R5xHVT8vNKwcPt
         +R64/3rRgWViUjlUgGmnr9EEYEEplj3DUs3vKlS2vokNQ89esTGxIQ+XaGp2VZIF34de
         zF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MF/kRTZirTozSrid61voE1vCZSfiREj1o+UV4EGe7kU=;
        fh=as0RKDD+fiaXY4YDNdBk6vOP3zUZaQ8btkrhg7iUBLs=;
        b=POEL6/fLkdJy7ie7TURG5nRcKMk4dCHLtAyBe0LvfLBCpESaUAea1WF8zeLj1TTmcz
         eP3FlyNLI0h5miB9WQwY/ocBqJBHSVRCH5YYqIgU8xIfwGO+tw5CXwc/UT2yCAD8MqoX
         MKD9CEi/wBAs9gmhNFoV4aCfLr94foRVyxrUZlCsdVT6hBX3B4y6JUc0mn1V49Uxi8uB
         IHzRcT9bRO+FgcQlFLSuJJTp4LiLoK9QJcS7AstcvcVC0YNj+1pClQWLX0Z18kfeqhAx
         grcOTGHIhjSYr3s24c15nLEXZpx/6Wyd84XiArXZyA/oh48BHX7iR7T28QxQXZoK8ZHR
         M88A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785885368; x=1786490168; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MF/kRTZirTozSrid61voE1vCZSfiREj1o+UV4EGe7kU=;
        b=jybEwZTbp1q0B+g8sk8/WxxThXm9UCKo1rfigCymMb62l0jWuQUaSACEy/Fp1CfICG
         Jv1e4CYP3KPPQS3/Gdvw8nNSCGa04gEts5jJnhMhBQ0qD6RJia6E4weHItPkrEoF4p7m
         IWVUKZUfuoBYdtFlg2zS8CjQL0rjHRLa33gKdsXIg2OPykruvq+r6xcZc0m9WQyzkBdW
         4yhkk9jW1nUo8SAiDziokf/Gk/KtWpNrFhZOtWJiex9O1Bcve+a8ho27ijM8OjGuB5dP
         NPj/g62coXng4cIM+aNcVqwKdQft++y24OVUtl4RAbY5FwHTEJKtlDYMt/EEmP8zN4eq
         ziaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785885368; x=1786490168;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MF/kRTZirTozSrid61voE1vCZSfiREj1o+UV4EGe7kU=;
        b=d88AcNv09R4AxRfW/7Kgs2Q7UdEQPgCwfEqpWG8ESmRAIgWU5q0DQ2XuhQN0Vo+OrI
         4Son5NcstddCXHHFzE30p/1e8egLKXelz/RLFI5mVFwO8stPSu8eLMMKFRDvskhEY2Wm
         wqmft0VxqqsQSg1kZrCqwwxo3TLWshAcSqfPfsY8yGSherRD/mVBpj/JW2sYtXuNWCMp
         LTHKW/6ZCsIWgilEdLeKDkZhRg/29b8c6Do8+tUwpIb9k/mtjXMx1VNrbHRQmyc5UNQL
         yFCxkTMF8mG8ROJiQNF11wt2qyt0sEVXuie9PsF9LoFL8uNb0iAwpmhcf0pvz5drwkeQ
         gwUg==
X-Gm-Message-State: AOJu0YwTAuvYz8BNf4IkH0/JsxTRiZG9CdQ9TrdDCZGwnsRvsdsQ+Pc+
	6Pfg9yC+9ES9WYCABCE8n8UCtBUdWZOwzYQx993RfjIEtZC8EQDcbKPwmBSjRJ18qW9DRuYzAOd
	VsrcUS+YLbu66Dq3rRCHbQuXxFVZ0669hR8YE
X-Gm-Gg: AR+sD13GIODVdYwETJilumBtv553syu3O0kYzKVLXFvUEUsAJSyyeHrP4exuqo6oXZ7
	bij/EFjt9G1PO4U8vhwPqk7Kg/cC0rD3DsFi2hQF/FUXHArrODkgjo/wCRk/YileZR5OItmCMGu
	0T0IM9ktla7M1SCjyCgv0qo5CQTnAFkf+NIxxUmT0T7fXRzdTxjRb6KpSZLNIECpo+whZ/jzdlq
	pS0UwbtYdT10kblmZAfo9ih3af9Sy9P5t2aDV3aZeK4PAuUhTQo4iu7Am6Ig9NA++wBqjnKudfg
	nBp1fSPvuCyBuwgnp1KUDRxG4VnbenE6So/FPnjCGwdMFFOEwmvtuoUYHsmgKqNNMmxcpyd9l60
	rR5A7CHEVhuWntC1tLmBucPcPYLoB1QuoUipTGfQd+6e8j4Cyp2jwapG+Mi3L1cY+nrVI7VnOPn
	ctNEw5AyE3TVoAFzEMy01CBu9Ik7wVX5Q/TTJbhBML8qDyiFLlmp6C4wA=
X-Received: by 2002:a05:6402:2714:b0:69e:8ad:515f with SMTP id
 4fb4d7f45d1cf-6a14f0c508emr1198311a12.6.1785885368015; Tue, 04 Aug 2026
 16:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hezekiah Depp <hezdepp@gmail.com>
Date: Tue, 4 Aug 2026 19:15:31 -0400
X-Gm-Features: AUfX_myCga71LEpd5uCkGFvYpRpu7w5JUhNHOldPYwakKxswC73_w2XopZeeOes
Message-ID: <CAHWVfF23RPFJ=k-2p-LraTT8RwQWDSZy1cHHZOhvif2g5=AvOA@mail.gmail.com>
Subject: ALC294: Internal speaker + 3.5mm jack fix for ASUS UX6404VI/VV (1043:1863)
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz
Content-Type: text/plain; charset="UTF-8"

On my Asus Zenbook Pro 14 OLED (UX6404VI, ALC294, subsystem ID
1043:1863), the headphones jack was completely silent and the internal
speakers would mute themselves after ~2 seconds of audio playback.
Setting bit 10 (0x0400) of undocumented Realtek vendor coefficient
0x1b on NID 0x20 solves both problems by enabling analog output (and
apparently keeping the HDA link bit-clock running which Claude thinks
is why the amps of the internal speakers mute themselves ~2 seconds
into playback, but I don't fully understand that part myself, but
setting the bit makes the speakers work correctly throughout
continuous playback).

Just to be clear, the issue with this audio chip is with this
undocumented bit. Everything in standard HDA space is good, pin 0x21
config, EAPD, amp mutes, DAC routing and SOF gains are all correct,
and it stays silent with SOF bypassed via snd_intel_dspcfg
dsp_driver=1 and raw speaker-test. It is also not a recent regression,
I tested on kernal 6.18-lts without any luck.

I found this bit by capturing the COEF registers as Linux sets them as
a baseline, rebooting to Windows, while playing audio off the working
headphones jack I BSODed the system with NotMyFault (a clean restart
without a BSOD would clear the bits), warm-booted from there into
Linux with `snd_hda_intel probe_only=1` to prevent Linux from changing
the COEF registers, diffed the registers with the Linux ones as a
baseline, and played with setting them manually until I found the
minimum change needed to produce audio. On a clean boot, turning this
one bit on fixes the audio and turning it off breaks it again. I was
originally trying to fix only the audio jack (had given up on internal
speakers long ago), but I found after fixing it that the same bit also
fixes the internal speakers as well.

I set this up to run at boot, and now my audio system works:
```
BIT=0x0400
IDX=0x1b
C=""
for h in /dev/snd/hwC*D*; do
  n="${h##*hwC}"; card="${n%%D*}"; dev="${n##*D}"
  if grep -qi '0x10ec' "/proc/asound/card$card/codec#$dev"
2>/dev/null; then C="$h"; break; fi
done
[ -z "$C" ] && { echo "alc294-hp-fix: no Realtek codec found" >&2; exit 1; }
hda-verb "$C" 0x20 SET_COEF_INDEX $IDX >/dev/null 2>&1
cur=$(hda-verb "$C" 0x20 GET_PROC_COEF 0 2>/dev/null | grep -oE
'0x[0-9a-f]+$' | tail -1)
[ -z "$cur" ] && { echo "alc294-hp-fix: could not read COEF $IDX" >&2; exit 1; }
new=$(printf '0x%04x' $(( cur | BIT )))
hda-verb "$C" 0x20 SET_COEF_INDEX $IDX >/dev/null 2>&1
hda-verb "$C" 0x20 SET_PROC_COEF $new >/dev/null 2>&1
hda-verb "$C" 0x20 SET_COEF_INDEX $IDX >/dev/null 2>&1
chk=$(hda-verb "$C" 0x20 GET_PROC_COEF 0 2>/dev/null | grep -oE
'0x[0-9a-f]+$' | tail -1)
```


Hardware:
  Model:        ASUS Zenbook Pro 14 OLED UX6404VI (board UX6404VI)
  BIOS:         UX6404VI.304, 11/02/2023
  Codec:        Realtek ALC294
                Vendor Id     0x10ec0294
                Subsystem Id  0x10431863
                Revision Id   0x100004
  Controller:   Intel Raptor Lake-P/U/H cAVS [8086:51ca] rev 01 (0000:00:1f.3)
  Amps:         2x Cirrus Logic CS35L41 on SPI
(spi1-CSC3551:00-cs35l41-hda.0/.1)
  Driver:       SOF, sof-audio-pci-intel-tgl
                machine driver  skl_hda_dsp_generic
                firmware        sof-rpl.ri
                topology        sof-hda-generic-4ch.tplg
  Kernel:       7.1.5-arch1-2 (x86_64), Arch Linux

This is my first time reporting a bug in this method and my
understanding of most of this is vague, if I need to send anything
else let me know.

Thanks,
Hezekiah Depp
