Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CCE37F74C
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 05:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786080124; cv=none; b=V5g1RhwlftrakSeAoZnbhfWLq5TwYki7aT0/5cfZDVRYtg05x77Z5MVpJksGs5i6+kEy42mxGNzBxMtOCQLug4Jh+fOIqgBbqjVCKQYwsqeieTJEsYEhYpaEdJYJR1IiRYdFTTAEfb6QK2iJIsrwLHPIV6xh5IyQJNnu5iHGRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786080124; c=relaxed/simple;
	bh=olHuLEH64Z9RLBEk/UCrTFEDNyrFxclXNFMwgT003jM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uqUT22USloe/zGrNcAsMqz6LYLTvS1b6Wf+Unaz+5mSwLEA/F67gJSkCH0eU/zvT47W/AViAH1zHeh82EYity0SwVYgu5HoLFVO5OA9MP8p9RvdKxUFUrLD/pQGfYjqKlYQY/3dE760oRdAWAHHQLLYKniM9E7hu4scWRfCKQ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz3Gvq/o; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz3Gvq/o"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aec6360133so2555135e87.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Aug 2026 22:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786080118; x=1786684918; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTIzY/gsSr7TabriA4xEhdubQ/7piKttMzIQdhji1ts=;
        b=hz3Gvq/ohPqFO35G2lZWymzmC3p3vBAUeBXUYmhCqeml+10wZxqfoHqH1TDnMzrUbG
         1S5Th9JHZiKSjW8iyFxgkbLwLL/z2W9hQgWCbtj/hwezyT+a2j8Ryr20NuLqJUzlBww+
         qA9Q5lQbrWOUQW+oRCdaG0BYw2ZmJk8FS5n1WW0uEoPyjx0Zh+cR8bn/tL3Ae4SPk7z3
         cgZSuKTve8RPAuznmLSk7gxfWlApoe+wWNuussTbqTrmy942fSaixbuhPY1bgIflZd90
         XkfsMEWYfp80kEOUv2GtuSXmqEolcfjPQCk97Svb1IghAVjBLGxwXFhAXfmQuEG/KD13
         rHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786080118; x=1786684918;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTIzY/gsSr7TabriA4xEhdubQ/7piKttMzIQdhji1ts=;
        b=P0h4o++14iZrZjzXbMdFzaq5cPzdnv8I3WIgosHWPCnaZjFBt2Cz12ufmm40snFDoV
         8F4y7A+MvF+pvzSuKMfmiBvo65CSx2HE+c/c+nGe6neVS8Wiu14iaU018SZBIlCREJLI
         DQljA3TMATcFT0hQ8O8ud0MBXWSldCSZ+RZZQP8uYHrvzP0nO0pTD1wE0X+OnZHE5xOD
         GZUk8MiweHjXfm0mG6pymvkFgnEIhPDeb/LsG7ikCzlQMekflYNNg3yaN14PAlVnZz4I
         bAXv0k38WL8DqcUPrMvG7PA7HphI3lia1JS8oerkhaewHxWc8ncf70cXKGVcuXdclTYL
         7c/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrbhNRSdiJwgNOab1wdXDjJvjkSI9SJCjizGD8KBjIyigOpbZKrIVSmN4XDNby2CqIOAK6FAG0+ZHN12Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU92mZXXjZUmk6dTyqDYklgPKHI96P/WnhTZxPFntl96FTj2tU
	gv81DffemggBqMOigb1ApF/qPWM6PVJhs5M/bCRncyQSKE2cBOMInife
X-Gm-Gg: AR+sD10rR0Xt/1elwz5Hu2qGBDjzaLOFt1ulbtBTHMogj2nWcOccODlwgp4Tn9kWTjr
	hlbiqXhhmiNcEUCGsk+DCQIN8vu32Fhpup0/Gyc2mk/IBkFJll2wiLfcAhdignr8Lv0vw+WeFNT
	LBLHGc9EDFo/q31n6wsbzXGrGYSY82/6d3xhFJ/WWo0sk7/juKTN5APy7db5G8/Vh393nuuxUsG
	an8lViia79flkhsNyqXnX5gLo8tLpM1HQMDDf82EYyhMKlu3U+8G0Ke9EV/84v2G2ZRO+ws7g9l
	anbyrsBIOjYFN23KmOkgAcW65pNzUpNPGVUZkxfrOZGGIgCALvJd3gfwtwjs7IEMRtLHP1UmA6T
	VqLFvQetEJXVYz3cVyCD1Rkc/XHRn5Va4UvdDbPpyJmYXeb0j4hI9HspWES226ImNGoCNYI2VqU
	AuElkukqe5LZF1tYIBWoDolLy9TYR2u4VUUO774rZcVMHaDiSgE4C1Q+NYU1CtOI77mZbrBGRpK
	GAf82fvY3bewAETxdT2NL8=
X-Received: by 2002:a05:6512:3401:b0:5b1:537b:de9b with SMTP id 2adb3069b0e04-5b2f4b8fc08mr2844780e87.19.1786080118114;
        Thu, 06 Aug 2026 22:21:58 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056eafc0sm276444e87.76.2026.08.06.22.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:21:57 -0700 (PDT)
Date: Fri, 07 Aug 2026 08:21:57 +0300
Message-ID: <a3fb7ef6957612f6eb2edb209fcbb07b@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Robin Everaars <robineveraars@pm.me>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
 niranjan.hy@ti.com, broonie@kernel.org, lgirdwood@gmail.com,
 linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com,
 mstrozek@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
 vkoul@kernel.org, Vijendar.Mukunda@amd.com,
 peter.ujfalusi@linux.intel.com, sen@ti.com, nealstarkie@gmail.com,
 bjuraszewski@gmail.com, Antoine Monnet <antoine@montane.tech>,
 linux-kernel@vger.kernel.org
Subject: Re: [BUG] ASoC: tas2783-sdw: every amp on the link selects the same
 channel, so a two-amp board plays mono
In-Reply-To: <39194f6b-2613-42a3-a857-702889add03d@linux.dev>
References: <20260805183517.8665-1-robineveraars@pm.me>
 <02f2cd9c-519c-4154-be58-9065f34c6001@linux.dev>
 <20260806184353.112230-1-robineveraars@pm.me>
 <39194f6b-2613-42a3-a857-702889add03d@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On 8/6/26 22:30, Pierre-Louis Bossart wrote:

> Maybe the mapping is implicit and defined by the Unique Number
>
> I am not sure though how that Unique Number maps to the -1 and -2 suffix
>
> sdw:0:1:0102:0000:01:8   TAS2783, device_number 3, slave-tas2783
> sdw:0:1:0102:0000:01:b   TAS2783, device_number 2, slave-tas2783
>
> which one is left and which one is right?

Measured on a second HN7306EAC (I'm the andrey.golovko in Cc - same
machine, same two amps at unique ID 0x8/0xB): 0x8 is the left speaker,
0xB the right. Confirmed by muting each amp's volume control in turn,
and by speaker-test with a per-amp one-channel mask applied: channel 1
comes out of the physically left speaker only, channel 2 out of the
right only. That matches Robin's amp 1 = left, amp 2 = right.

The Unique Number to -1/-2 suffix mapping is not implicit - it is
hardcoded in the kernel's machine descriptor. amd-acp70-acpi-match.c
has, for exactly this platform (rt721_l1u0_tas2783x2_l1u8b_adr):

  .adr = 0x0001380102000001  ->  .name_prefix = "tas2783-1", spk_l_endpoint
  .adr = 0x00013B0102000001  ->  .name_prefix = "tas2783-2", spk_r_endpoint

where spk_l_endpoint/spk_r_endpoint are aggregated endpoints with
group_position 0 and 1. So a channel-to-peripheral binding does exist
in the tree, keyed off the _ADR unique ID and complete with a
left/right position - it is just not plumbed into playback port
allocation: nothing turns group_position into a per-peripheral mask or
offset. device_number (2/3 here) is attach order and indeed cannot be
relied on; the unique ID via the match table can.

For cross-reference: the same mono issue on this machine was reported
in July by Antoine Monnet (added to Cc), with an inline patch of the
same shape as Robin's - per-amp one-channel mask derived from the
name_prefix suffix:

  https://lore.kernel.org/all/778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech/

I have been running it since late July with correct physical L/R on my
unit (Tested-by in that thread). Robin's finding that the mask value
is ignored and only its weight matters applies to that patch equally:
it works because the DAI-link codec order follows the adr_d table
order above, which happens to match the speakers. Given that the
descriptor already carries group_position per unique ID, deriving the
assignment from that rather than from parsing the name_prefix suffix
looks like the natural fix, and it would keep working if enumeration
order ever changed.

Thanks,
Andrey
