Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A70232B12A
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.196
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773355; cv=pass; b=uHm8uQupc3w7dQl8o50oX+cTjD0gt1hbSh4UH6lXrzZqwClXYpJEr+Dfrku9KxcD2TPqn5fwyDHVdxMpT8MN8EZ+YDGWjeR12GrJ7V6ByrNpmGnqHZajVUhzMHWBYirGocLQjxf7+FiFS4JEcW/0y1A5YE1+3bTCBHP23GEUXWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773355; c=relaxed/simple;
	bh=LObWtdLGgUtgYYizwjPwDrOP806K49jhsFYlpiAtJc0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TYoRAcGh64dVBcTR11R55sX/t5wcQ5n6A71MfIZWItarKT2jYMrwcJE2pFodzHoHqiX5OdYvuNrLq4gKIicMrrV3WxpoH9VMuJkKnHa02IGJGt/ShPvZ9nmFPAjC9kIpnETTrtK/bzZsbzR5CLpLURLOlMCFc9M+AS1hznqelv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rodud.com; spf=pass smtp.mailfrom=rodud.com; dkim=pass (2048-bit key) header.d=rodud-com.20251104.gappssmtp.com header.i=@rodud-com.20251104.gappssmtp.com header.b=bFaRgYtK; arc=pass smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rodud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rodud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rodud-com.20251104.gappssmtp.com header.i=@rodud-com.20251104.gappssmtp.com header.b="bFaRgYtK"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so355427eec.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 02:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781773353; cv=none;
        d=google.com; s=arc-20240605;
        b=FyEzM9CtLjgLKj/CWvgtAWfLhscDgdEBJugzwHKd+nEz8i29wxZzklPvEc3TIRTmih
         1ghpTzMFIaeypmLmqxwydIVuIWei5XLiqlYWl8U3AODf3Ca8dMUJsl3F6kexz74mpez7
         tVkiChLM2SxIqJKm9lABrIaqK7N7vTA/uQS29JTwFyT/9Akk3nCLG164ecZP+9lK9T2k
         DIBZCmAd0ntJYyG44TUvDwJ+FUfMPJ6O+sArq6sllkfE4N2L/Sn5bTSpzzv0vMo/l0cU
         dfu/m4b/uCxZOYxVC7ETZbHW35A48X3D5S1e/ZLS9S9EkDEcKezu7Lmxi9j57rp3xuDm
         zALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=I3hjceSsHc7gFk0JI47YKyJvXb/upV3FCOdsxfdv4Ng=;
        fh=oRDMZoPOJWq/9K/xNn+6teBvy/aiTLRIFC2c1CYQVFI=;
        b=LT/W0AhCxCFmRbs0iLc0OAUo+JoDg5YPJTqjAZ+ZkwiKkAUwIYXXmgE1fKNWre16DJ
         ekFWUkTBhPzySEDzlLfR08dwsuezbVZDritdfLyG/YaPRzWwmq3uckZeSQFZRu0vcmcX
         +35a7mIyVGdimHlBQkZPIzJ8EJdxqaULff8KVnxWpANsCEUQOdjjyGD3seIdDs4J0JP/
         rHZHiLQDUrLm4ZBPug7G0adUhtH4f7dZUM68IySirRP9Y2EesWIT2UxTMj/YgZGkPt5p
         to/KyJb0OJ7r4Pg5wqt4O8ReoCx7OHtH04Lic/X9zrUqaDUu1xYVoDqAH9BCaKCjmsiB
         N8ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rodud-com.20251104.gappssmtp.com; s=20251104; t=1781773353; x=1782378153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3hjceSsHc7gFk0JI47YKyJvXb/upV3FCOdsxfdv4Ng=;
        b=bFaRgYtK4wL2ju2gN8b07qMRKF+xKQfk3O/+S+HF1K+5/VJtABwLeHtZfcEU3fyifd
         +idm19949Y2aZvH6Wcqdfp8Lwff8SvqJ0MXgCcpHBaaoVxNaVrNQBSmO2zaZmAVxNfPm
         TyNI7UnWGbCEXLV51CJPgfJbNloZdm02EbKiptgUSkOpAx58fLqq3ueRV8cP2PZNvfd0
         lhaNoUiy3GtPzhzGm07QbwuGmKHPyL6O+q9K/cDgIYR88kxU9lfJfaK2+Znn586i8cyR
         6mcocI4gRxvEAEozoCXY9/G5YTAawTwHN8lVjjr84MWC/XyYy3sqeYWty3IUszuz98uG
         5tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773353; x=1782378153;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3hjceSsHc7gFk0JI47YKyJvXb/upV3FCOdsxfdv4Ng=;
        b=tNiAwzlfwWwehn3wAcOLSCFoCkkx3/PjhcJ9gMKE3BC1RB/Gg4UxWvRDum/ucYfJ1M
         FY5TGGwaPF70q9AVhcr/VpHYaK+X9Mpy3XVQf4UX02l9ZlotnKiibxf2jNK/ljfd8PpW
         aCu1ZJfe0qUn0mzu3hBiwiWLB3PbXwhxaXfNP+TEpBJkKgs1PNwhUrPnaUFE+T7BHn+d
         QN9pEoEpv52WqWLpmf7FAhrNzbeVHJiYv6pVHld4Esqch6LfXsADo3V9pMD+bCeRkSKQ
         qQUZQI1CF51IYG3+NwJxe1OKexPgeF/saAnHxkJFZjpg1TWInHX4AaDDZhDs4L/GluaV
         VxKA==
X-Gm-Message-State: AOJu0YwiL+gTY2EUL6G2EbDeygwxjvGA9Z1kthDx6mSCDGv4yvhzJrUr
	yX/HSLK5al7RxSSV/CCpdA/bbO8kiA89sfqDqI3Csc6GJJKTfpuMK+C3Jrv6O5jvu3wcfkeXQAZ
	tVqd5c4nAZi7bBMcndwa2RbFM+tenvA05kTyOPjoPZK6EOn9fhtr/4sY9GLQq
X-Gm-Gg: AfdE7cmqzOTtH/7BzMS/BmGS9zPUs2ZThqJFjB9H8e+9FFn869vBYbMmYZz/5oII1FK
	mh2Jta8YTCwr+TRJtxYJpnHQzKXBAF8LNHE7Stg5UerfHu8ZNTUCdz1ajY2QxJ0Vf6l3znuKn/g
	6BBmaZbsNecDN2FBE9/jnNCa+7Q1VQU3NIDzvkJX0UFMnBM7k/z+MGPnju4/rzmZe8QGE1huAjR
	8/wlMxzrp4Lb7lQLZ/cdLuNpST/a+ukDhM4KLaBtAdsWDZtrk9ejia+02ggNSuP6t6YMCiWofzP
	7Y/nOoSbXu2DIVdI40z3AXtMkWY5TA==
X-Received: by 2002:a05:7300:2316:b0:2ed:e16:6b4a with SMTP id
 5a478bee46e88-30bf7276868mr1211737eec.32.1781773352816; Thu, 18 Jun 2026
 02:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Omar Mazen <dev@rodud.com>
Date: Thu, 18 Jun 2026 12:02:21 +0300
X-Gm-Features: AVVi8CfpS3ZrT_dSTuxasVPR_rxbPiY0SUwiO4O9dZ_egFtJ2O0dT5jxj5dtgsA
Message-ID: <CANgpnCKtfC1bCEFDSEeVHF1m7cuopnWf7VyuZtHA6rfGarMWGA@mail.gmail.com>
Subject: No analog speaker output on HP Pavilion All-in-One 27-ca2xxx, ALC274,
 SSID 103c:8acf
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de, Mohannad Tech <mohannad@rodud.com>
Content-Type: text/plain; charset="UTF-8"

Summary
-------
The internal speakers produce no sound on Linux. The HDA codec graph
is fully and
correctly configured (stream reaches the speaker DAC, pin unmuted,
full volume, EAPD
on), and audio frames are delivered to the hardware, yet the speakers
are silent. The
same speakers work under the factory Windows install. This appears to
be a missing
board quirk: HP's Windows driver performs a vendor-specific
speaker-amplifier init that
mainline patch_realtek.c does not, because there is no fixup entry for
SSID 103c:8acf.

Hardware
--------
- Machine: HP Pavilion All-in-One Desktop 27-ca2xxx (SKU 8F8Q8EA#A2N,
board 8ACF, BIOS F.22)
- PCI: Intel 8086:7ad0 (Alder Lake-S PCH HD Audio), rev 11
- Codec: Realtek ALC274, Vendor 0x10ec0274, Subsystem 0x103c8acf
- Driver: snd_hda_intel (legacy HDA, auto-selected; snd-intel-dspcfg
dsp_driver=0
  resolves to HDA, not SOF)
- Kernel: 6.12.10-76061203-generic (Pop!_OS 22.04 LTS / System76)

Symptom
-------
- PipeWire/PulseAudio sink analog-stereo, port analog-output-speaker,
RUNNING, not
  muted, 100%.
- During playback the PCM is state: RUNNING with hw_ptr advancing -
frames reach the codec.
- No audible output from the built-in speakers. The internal-speaker path is the
  regression vs. Windows.

Codec path is provably complete (so this is not a routing/mute issue)
--------------------------------------------------------------------
- Internal speaker pin 0x17 = 0x90170110 (Fixed, Internal Speaker), unmuted
  (Amp-Out [0x00 0x00]), EAPD on.
- Pin 0x17 actively selects DAC 0x03 (connection list: 0x02 0x03* 0x06).
- DAC 0x03 ("Speaker Playback Volume") carries the active stream
(Converter: stream=1),
  amp [0x57 0x57] (full).
- Headphone pin 0x21 correctly muted ([0x80 0x80]).
- Codec GPIO: io=4, o=0, i=0 (no GPIO configured as output by the
generic parser).

Everything tested (all negative)
--------------------------------
1. Mixer: Master/Speaker/PCM all 100%, unmuted; Auto-Mute disabled.
2. Driver selection: dsp_driver = 1 (legacy), 0 (auto->legacy),
default - all silent;
   SOF is not auto-selected.
3. No I2C/SPI/ACPI smart amplifier present (only RAM SPD ee1004 @0x51
and BIOS spi-nor;
   no CSC3551/TI/Maxim/Realtek-SPI amp HID in ACPI).
4. GPIO probing via hda-verb: each of GPIO 0-3 driven HIGH individually and all
   together - no effect.
5. GPIO probing driven LOW (active-low hypothesis), individually and
all together -
   no effect.
6. EAPD re-trigger (off->on) on pins 0x14/0x15/0x16/0x17/0x1b/0x21 - no effect.
7. model= fixups tried (reboot each), all silent:
   - alc274-dell-aio
   - alc285-speaker2-to-dac1
   - alc285-hp-amp-init
   - alc245-hp-x360-amp

Request
-------
Please consider adding a patch_realtek.c quirk for SSID 0x103c8acf (HP
Pavilion AIO
27-ca2xxx, ALC274) to perform the speaker-amplifier init that Windows
does. I have the
hardware and am happy to build/test candidate patches and additional
fixups, and to
capture COEF/verb state if guided.

Full alsa-info:
https://alsa-project.org/db/?f=4a8ea2f8efd84e29880038e40c4f789dda576b3a

Thanks,
Omar
