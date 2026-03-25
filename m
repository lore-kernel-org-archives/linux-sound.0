Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DC430C62E
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 12:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441627; cv=pass; b=ee6kMwvNq6CH7GZfgqmvi12NVy6JLdVPygOWdPdX0rNewGX8NnqR+1g4nEBTZ70X/lxrDxzXWBp3epEVT/HHuxhLqPiV5+XSsw6QzCsLif5j7W7f7vvs5xky4SC7ns2g4kvCvyZ3mpKnhmAduVd9Yr/chkEG50Q7yov0TMVwla8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441627; c=relaxed/simple;
	bh=F9V/eMp4M8BziA52Mpx4HG3b+LtSlVb0qprLtUzCKYA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JegLFB2Pwbrsn8MebkbhEURWhC/21fnNANkeYGcCwd6clyAIKQRFBjrbh3NlPjqjOadDoA20QOFnIr4zoD0+3WmODWWRwK1MYuQdet4r/RrFQFc1/8pKRyE740uDcqLyvhYagdt+gk0DLN2xyOP2gHvTe8t5x6CU0iDwiehc3rA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKmEKwtk; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKmEKwtk"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-67c27a90a60so1420476eaf.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 05:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774441625; cv=none;
        d=google.com; s=arc-20240605;
        b=a9WApxTsG1JDyDpAchAktH/wWYH1QWknM/Ov5D+yIMO32R0DTZ5qrlWnwmkCQ25r88
         hrCSkUJaCNitbRO1FxtBxair8wk3UIz4FOcBOS84wZUVxrMO4vuleGtoT2JGaeUBvVhJ
         QjM48OEoMWPbyJI13MVDWfSlG6bHL8KDCthCoxdsktb5KwYqVueVR42nN/A9QSIMSBwZ
         QitplEYRYMRgWU7vsg+axutvXc3ZZNmbbumUkuS9O0EI1CwQEv7F8Ia2khsWlRi0h0pi
         6/Nz7gsKTHtrqAwnnyyI5Th0gS8axaxsAt7oMt6nN4/FEZBwrHvBvWTcnyuIC4w8fe+s
         OpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HFvoVvwvCpoSrZvfDIYva3ZmHvLmFaGJxwwa8F0Vrpk=;
        fh=XLqeZTz/hUjfTq5+0hY/ym4NWI2dkr+p4/bs8Q9ujnM=;
        b=TXp4LWZoJq/EEBmmO2gw4n1i06SNL4xoA2rQVgf3//GFHP1fweEVyzuaagB3bDv1sN
         PBddrJyfANhRd6AlavKY5CNyGo9b9u3JATKvnyAQTA9RsvHK2NY2HFG9FBD0Zs6cdbKU
         O39/7TCdHiSPWlbqhB7JNeNoB+avuBXSWLNyjEkF+3FnvJobqJBvtTNh7W1b5+FdutZ+
         PVLQFip20+R+LWrSHrn295WjuTn2vOfn4/DiV9oTMx0rdbEJoohhF5nfwiERc21kd8q+
         /amJdVwlBTEkX592erlKj2TrCNNpVNv943u0vJm0BHPdta07vG/HE7yabQn8uLEH3PPP
         TZnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441625; x=1775046425; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HFvoVvwvCpoSrZvfDIYva3ZmHvLmFaGJxwwa8F0Vrpk=;
        b=UKmEKwtk/mU54+u/h7TiWSxmKsrb1atKTibCaJ9a8DKVgZcoJcLV/7+IcFfcxf+Jtr
         WV5EVjsjTn2hJ1CqcjBI46wbcIUdlDOBpTVBNqGl3jO+FrEZjuHvaMvq3f3LJM37z+aL
         qs8Ezo17I6MiEXQLG8y00+4JVl4Ct6XydI6sSSo02phabYfjS+Atj+aKB6nleaMQp/7M
         80kNHOc5X8xFZDJYhkJDksvq61SVIln4dGVbOD0TadhtTg2nO4P3H7ykoMu40On8cgT3
         aed98jcJH4nDtasPDYJXIjlMveUlHVt7px4n2hVquWXz0TWOv0V4cmWIambJOwyusZbW
         vV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441625; x=1775046425;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFvoVvwvCpoSrZvfDIYva3ZmHvLmFaGJxwwa8F0Vrpk=;
        b=CZLCvEqSwnNoW4pncEZ3bWV8RozNiLWSxcMf4wH402o1qaoP5ZlfgEb/kj4oZ9yL3v
         u5m2WYX68Xh9ftvAjpVlC1L+WUxvuixZgLsPO/KGO5LvLzfY4Y52ZRH/ylnlk0aMVFaj
         6945efPzqdMd3xbkZFYe30QjtiXKSH9Xd4FuEZMr214CvLd6DvPESbLwT3bqwWrqFdY7
         NbLciBJHLGwl+e1TIRaiaP9Vku9GanYyfQ8SmB7d7Z+Oekz3hgKFnU2hoZtusXYUpId6
         EVQFvSkyYTS5cr+4y2uGnfhZsawzHhPGgMZ2Z4BrRYh0jGKyX/Af2XHbzT2jBC4aljDJ
         3bzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6dBhntXhEWbaTNPpqoHEEdcAK5jy246P1+jvgis+drS2MTrHaSWLbaNppW8Qh52E7vuDGF6AdDe0evg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpzYjTBe6BxDLbFKcsb32/THi35K7S/tgd0Q+rgF4Weo61yEFh
	edBaBPQNL5fRI1vS51jOzIldIQBf+b+XYKecri7CoEpdCxbQIPIyJ3XuTL+VH/Z5cc/uapFGiFu
	t3CRZeMmEhSLcRXb+pWEywt1NFWFh6OHYd55H
X-Gm-Gg: ATEYQzywSykWkUrhaPeomwWLFJImgUdQCTVCxhIJLqcIcyYEPgwwOOAieYZOIH/pE2c
	haUDiKufAmuybFzJLpa70a+xbHsoMhKJL4zPMiSvmt8vIXAGzyc3qG43hqiFIdDHNqBfKa8OHwP
	BEMIEupd4S0d/HHC58Dj/C+nxQEHnw+gyFtab6gWEuaVXQLp4rbchRb6qi9GfBH2y/U26Ez+wbt
	nukf2CVFchTi+0C6V+OdOTBGRkH1b9ioFnh38owH27nNizN6KJrLzu8hrJ/1H5m+e1GZpQFPhsJ
	L7F7ftJPamY0tVJAFA==
X-Received: by 2002:a05:6820:61a:b0:67d:f465:77d2 with SMTP id
 006d021491bc7-67dff54b558mr1876414eaf.65.1774441625496; Wed, 25 Mar 2026
 05:27:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rocket Raccoon <rakketje1@gmail.com>
Date: Wed, 25 Mar 2026 13:26:54 +0100
X-Gm-Features: AQROBzDZV83c5Fx9TiPkJ3gyuFfpbuJmfa9paqaY2BZjAw6BS0Vq6i6bxEVX8Cw
Message-ID: <CAL76xbU81CKcbAD436djDbJ8P+xsj0r24i7phFG1YcSVr2n2JQ@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 14AKP10
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Lenovo Yoga 7 2-in-1 14AKP10 (PCI subsystem ID 0x17aa:0x391c) uses
an ALC287 HDA codec paired with a TAS2781 amplifier connected via I2C.
Without this quirk the amplifier is not initialised and internal speaker
output lacks amplification.

Signed-off-by: Lucas <rakketje1@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index XXXXXXX..XXXXXXX 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -XXXXX,6 +XXXXX,7 @@ static const struct snd_pci_quirk alc287_fixup_tbl[] = {
  SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo Yoga Pro 9 14IRP8",
ALC287_FIXUP_TAS2781_I2C),
+ SND_PCI_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10",
ALC287_FIXUP_TAS2781_I2C),
  SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL",
ALC287_FIXUP_13S_GEN2_SPEAKERS),
