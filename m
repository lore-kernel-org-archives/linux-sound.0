Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8706365A19
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 23:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786489349; cv=pass; b=WGoqm0RzotsvI5rUiLDN40kbBoZSvFJOMzej1EVVo4ZxDWlZ0B6WN2LMAMZsydw4kS9k/mfL7P99iEHFRHcxWBSzni4HoUQxljWVIljWtm9KHkoeOIz3DJCoTAjl6ygMGiukJm1cNKlBETwY8Syla1g3DE+U4EXUp1l/iy57Lnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786489349; c=relaxed/simple;
	bh=ShbddW7mELQmRSzLa6+ZKEEZehIXyfWmf5kiFqADHXY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CjXvOZNihjLAID5g641LZOXFgabrkKvWpUNiChu08Zh8y28TmmUdm027Tfa91b1uCSlqbBICMIEpANnhtiADAFArdBX63gH2YDPcGkUybsupWbV2FgYGLDOomLCD7iyNhHhRYd4XCFbrbu0zRNLSBZ/6N4XY8nsMbDxC9wsrKfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjW8LBg5; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjW8LBg5"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6679d88abdcso645548d50.2
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 16:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786489347; cv=none;
        d=google.com; s=arc-20260327;
        b=JFxvTsbsiRTrzk67F0+h3jY95DeObjR5P867h9GAIM++6mybMWMzG5pixsf1sCTp4O
         veLgqmg6EPPxfVOfi5MlFcS5aN0uKRajGF2b1EN3KWkJ+XTZQTalM6tGmLedmLrh4xhB
         PjNWhrfNU+HrVayXYKWPCR1WRlXfNpm2LZN7r5C3h1ojvq6YOF6DgIT7YxrGUCTROg7d
         i4ipYiIwKGiJoYQORRvPjcJJdKATCCoDRKWIpjDPZEwV/1lrWpgb9jM4JfgBFYX3dQxn
         +a/cFzZgOJE2n332CLknnzhnhhSi0ATOLfrqZ9adXh0Mp5TT416q5b2eMqxj5nWMwqvG
         7C0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3HRaaPgZ8YLqgi0ahDNyK9IYjpPSagcZrlAUY/4gc/I=;
        fh=RGnJuy/Ycrv4InBWjIdiAKsAIfYtfI+FYs6Ou0adh4s=;
        b=OiaeSfhHsxSqjs0WUrapuBmc363coB6oXXWJVANLXlz1iQDX45Gr08QnBROieY1/TV
         d+itfT08RB1GfyTv6O/XEbdTvF6aYXjYVEKq4Ow5gZ5mws0Ibrn7OTsC53Gg7Lp5UjvF
         GYiNwUXuCqK0N4Cn8uacYqUs8pFafvxBpHb9Mbe5pB4bOO5Qpn6ijC5ZcBMZpEMlFJce
         hBc8MlZyivtussZ/MkfyC7KAB6mFCagGr2T2kUfFO7RMKF/6YCOY6v0UhDDizNe3MrC2
         tTXpXbx6A9Hog5WtyPXikLxfDvzGnbAyVuyydwNaLPUUz7jPlx54yczAPTnFiijPtqH2
         S6xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786489347; x=1787094147; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3HRaaPgZ8YLqgi0ahDNyK9IYjpPSagcZrlAUY/4gc/I=;
        b=YjW8LBg5RrJpToIfVbKwquJDEstR2HZ6h3+pqvE767Qwz/kWmbMf+SRpjfwXP355gk
         uMXxBQpubL+mJ+MoDumDt4qOQm19gl4pwDNETyyznROofSUE0TR8rpi3nrcGYuqzVnZW
         rpWstmZkaPw0fIlB1aFOrlrf89e9eRxnvPowFOGHKMrRRNZ5iMaolia63NkrSMp1lpIc
         Kr6FvVDNQOHNbL2t/DTP+awc9KMpy45Eb03eN9PxoQcB75WOzUcFO+pvfr6xp5CKo0eL
         LieEdU9Fd0NePyAmLYbkWLXen9ljNWh+xMeO1NOPxSTofOICy3irRNKKPGLQAsX+O44u
         iljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786489347; x=1787094147;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3HRaaPgZ8YLqgi0ahDNyK9IYjpPSagcZrlAUY/4gc/I=;
        b=ASKK3+cxP/7sMuKD8I3s5bKGOxDW5RKS7cSz0vgiQnmPAd1AaVu0jaZZ5bGNQlDvSF
         xeZmrAtCWFo2oAn+frR9gw1yzX4Eptv5VRb9s8dswVB6FG0zdGpdBvGRYwzdg8O4hyQh
         DUgS9I8sNqMdHzZUXtyFUSndLSzK0ciflggtHHccZLYC+48CS28AXzfAYJTyfop4uivp
         f0L9zMrgQ2vYQktfmsIgf6ErQkX4qO/yX0cs5TTUvo3pRq9JuMIZv3qZwXhtrMU50xmI
         J21rAWUThg8F28d7ZWfxU4yyTgpfGLKLPne4gBLo/jk1NnfMzxVAaaliMi8jSSO8CflW
         COlg==
X-Gm-Message-State: AOJu0YztkbTPFo5sgaBWrZk5n9wCjxPIpS9QMJ20uG4/i05Q/X+2Qmvn
	ypFNGSP9tSeiBl6ChHkJki98AIrkWGLoA9wyw9hc1EHoeDY1v808DHE9cl5NLmKAq+4TZve6Yll
	McJNJ0ZUWTNCqj6p2g8So3T9Md8ImGaQ=
X-Gm-Gg: AR+sD12R1HLYbsZfZkbx3nyM88lKmfhncLkwW4hInsB2Nsk/cQD87+NdqyddLnNwJm7
	O4DxD50bwzkIbdkXnIT97JWNci1o+Q7lyh2P+4XhD8431lAgBOJAy0iO/nzzcGoGiz3ygLH2dwq
	aaOaHZxluOraruWGJ7mH5TaXkFWy28J3YOxSlSlg8xMVWdtgy4T+whn6JmvDKKLizI01/s8syMs
	4Wzu9Lbdvvouq9AKwKLUUKUT9ZxyJ4NRmdqPO5Y4kEdZteVOnk/UkWRX5e/32IoIqij0LosVLs0
	lqS+j4BEWAWu3dInY5d50SsddQ0/XmiEqkG/KfJI3k1KDFrF7yJyaYs=
X-Received: by 2002:a05:690e:244c:b0:667:c09c:4a36 with SMTP id
 956f58d0204a3-66b34100c12mr342636d50.11.1786489346568; Tue, 11 Aug 2026
 16:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kel Modderman <kelvmod@gmail.com>
Date: Wed, 12 Aug 2026 09:01:49 +1000
X-Gm-Features: AUfX_mze1jQ-YO12tVxiNLU0qkeR6krACQ-S9rqECzpldzdY9MGH1rnzpjQ2NZY
Message-ID: <CAFcu4SY1cRs4WD7=ZaD0s_ybYXO2=d-ZMG+dSeotktuPrz2YUg@mail.gmail.com>
Subject: ACP7.0 SoundWire: two TAS2783 amps, only one channel reproduced?
To: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I have an HP OmniBook X Flip 14-kc0xxx (board 8EA1) with AMD ACP 7.0
(1022:15e2 rev 0x70, subsystem 103c:8ea1), and I am trying to get its
speakers working with assistance from claude. I have got most of the way
there but I am stuck on one point, and I would be grateful for your advice
on whether the layout I am using is the right one.

The machine has:

  link 1, uid 0 - Realtek RT712 SDCA (headset jack and microphones)
  link 0, uid 9 - TI TAS2783
  link 0, uid C - TI TAS2783

Two local changes were needed to get a card at all:

  1. The BIOS reports acp-audio-config-flag = 16
     (FLAG_AMD_LEGACY_ONLY_DMIC), so snd_amd_acp_find_config() returns a
     value that neither acp70_pci_probe() nor pci-ps.c accepts, and the ACP
     ends up with no driver bound and nothing in dmesg. Adding the board to
     acp70_acpi_flag_override_table solves that.

  2. There is no entry in snd_soc_acpi_amd_acp70_sdw_machines[] matching
     this topology, so I added one.

With those two changes the card is built correctly. The headset jack, the
microphones and the UCM profile all work, and both amplifiers load their
firmware from ti/audio/tas2783/8EA1-0-0-0x{9,C}.bin without errors.

My problem is that only one channel of the stream is ever reproduced. I
measured this with the machine's own microphones rather than by ear, so
the numbers are repeatable:

  amps on group_position 0 and 1:
    only the position-0 amp plays, and only stream channel 0

  the same, but swapped over:
    only the (new) position-0 amp plays, and only stream channel 0

  both amps on group_position 0:
    both amps play, but both play stream channel 0

So both amplifiers are healthy - either one on its own reproduces the
whole signal when it sits on position 0 - but stream channel 1 is never
reproduced, whatever layout I use. Nothing changes if I use the other
firmware variant (8EA1-1-0-0x{9,C}.bin).

I modelled the two-position layout on acp70_rt721_l1u0_tas2783x2_l1u8b,
and the shared-position layout on tas2783_2_adr, which pairs two devices
per position with /* left */ and /* right */ comments.

So my question is really a simple one: is a two-TAS2783 configuration on
ACP 7.0 expected to work, and if so, what should the machine entry look
like? I am probably missing something obvious.

I am happy to test patches or collect any further information you would
find useful - I have the hardware in front of me and can rebuild modules
quickly. I can also send the two patches I am carrying if that is helpful.

This is on 7.1, and I checked the relevant files against the current master
and the sound tree's for-next as well.

Thanks very much for your time,

Thanks, Kel
