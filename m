Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84562144CA
	for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730308709; cv=none; b=RSlq+rXNM1xIzhAPZA1zVyY+1pLN3lCsXLU31r+wCPRDkXUx/gMKEXId5d6OsI+PYJUeC0T2qzyOEiTt31JAuzRc4HaKxeIM29h+cSPZSdLGq8pDlXadCrlKYCv8hQsvMskE4wEky5T2ic84dD3Q++8XRZd3Dt8ibgstEEUPz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730308709; c=relaxed/simple;
	bh=KRfBpsFOUD8r39A+kX3+BxJBkGp7hk4dwoyITVXv2N8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eBNw4PHdq//Y2rxgeGBEXUp6iUx5s/HvwRohddXLB6P5LLGl7wKrWYntmbq1Q5ioT5bKWcrUWqPbHoZv6UpJzGv4G3mMcWjWoAtDoZbHN21k07WLROJlfsL33niABBL0DswcWa1ioTyCEGyAGHUMdeZLN42rXRkvsFIW/URDZnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJtkCkwU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJtkCkwU"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a156513a1so6322966b.0
        for <linux-sound@vger.kernel.org>; Wed, 30 Oct 2024 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730308706; x=1730913506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+4yF/YH+X3v2ulRiKhGwpY44SijY6SI6JcgbfCbu+o=;
        b=LJtkCkwU73Tltqrji7OZ4nM4fyKZvbtJ8Rzx/5I3xrAOaLjnjXb2viizLQznIS0Hr2
         li2AEo3qKfw0Aop17dsXWV6rZlPhQCqfu6oW4XB5NG1nGZFStxjBOXGimeKTOjzzqBOQ
         1VSaUEMhJNF7hk9W2/R3lAvBddCJgmLhoO2XYL21z3+8aKye9ZiQylcvZ1zZYe1zV1eT
         6tPr73xQiHuGT8xPHRzQw7vjiDMotrf2abx7bMIJPAUkjFL2dymAMsITp+bSJnFwgRxX
         87lnRFATs5TS74FiuUSgeENU0SAj47QB7GSddzMCFQOglMMGlbaGxGf7QFelMcRzYWqM
         crig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730308706; x=1730913506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+4yF/YH+X3v2ulRiKhGwpY44SijY6SI6JcgbfCbu+o=;
        b=pY+aJxO2y08slg3dc/+EZR9ufn/myuFC9a8/VrntVJREK/j1t75J75Ruu3eAHnrDdf
         2ZgJUjT24qonNXY/5/bSc8F+uDhMA9aaRuNjxqgyF8DcCYOYq5opbQtn1PquNA2EWqST
         UDR5TBaU8UyvjMjsDW8jDZRE7MACGZtLK1ihWJp06MI6RoC592Rp6ETQchCpk2s4ikAZ
         IHgGULnf/xD6oMk3JjTFTONe1A5x9WrFXCkwNjHWjDfACFad+an02OC9YOJRnOJGHO8B
         h1Ix0mESfTMkXL8JyGRg1WlcsZ0Mvx9JAHmOWSDO3FK/VugOmD0Fzrmwzki6W06+VHzL
         pPEg==
X-Gm-Message-State: AOJu0YxUVf9y9+lk1ATW5p1QvVmvXZh8srJn7aOC5+54BrrO5emMapby
	krstIMoSpRjm6d51yVvyM35fwTQDNzWgPv6XA2i71SuIRlIXJVPfgd763VsE
X-Google-Smtp-Source: AGHT+IFXKN2bfSulc0hYhyiB2N3doYOAJ+mvEyqlBMIBwL3QSDZ5wtnaPCepJgWNUbxkuEUSBM4Bdw==
X-Received: by 2002:a17:906:f59b:b0:a99:4780:1af with SMTP id a640c23a62f3a-a9de5f6e2eemr1615919066b.31.1730308705750;
        Wed, 30 Oct 2024 10:18:25 -0700 (PDT)
Received: from yaro.. (adlk52.neoplus.adsl.tpnet.pl. [79.185.14.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e214152adsm207582866b.92.2024.10.30.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 10:18:25 -0700 (PDT)
From: =?UTF-8?q?Jaros=C5=82aw=20Janik?= <jaroslaw.janik@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	=?UTF-8?q?Jaros=C5=82aw=20Janik?= <jaroslaw.janik@gmail.com>
Subject: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
Date: Wed, 30 Oct 2024 18:18:11 +0100
Message-Id: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In Comment 17 of the following bug report:
https://bugzilla.suse.com/show_bug.cgi?id=1228269
user tigerlily had complained about "audible blip on shutdown" on a
Thinkpad laptop, that led to a commit 4f61c8fe3520 ("ALSA: hda/conexant:
Mute speakers at suspend / shutdown"), which mutes speakers on system
shutdown or whenever HDA controller is suspended by PM. The
aforementioned "blip" is a feature, not a bug however - Thinkpad's ACPI
firmware uses short beeps / beep sequences as notifications in response
to various events (enter/leave suspend or hibernation, AC power
connect/disconnect, low battery, etc.); these can also be triggered by
writing to /proc/acpi/ibm/beep, see details here:
https://www.kernel.org/doc/html/v5.4/admin-guide/laptops/thinkpad-acpi.html#acpi-sounds-proc-acpi-ibm-beep
The firmware doesn't touch any mixer, so depending on current mixer
settings these beeps can be loud, silent or even muted completely,
whatever has been set by the user.

The patch in question interferes this badly:
- suspend/hibernate/shutdown related events are muted altogether because
  HDA controller is in suspend mode when they occur (or snd_hda_intel
  module has been closed in the event of system shutdown)
- other events work "randomly", e.g. you can hear AC plug/unplug beep
  if something is playing audio at the moment, otherwise the HDA
  controller is likely in suspend mode, so you can't hear anything
  (unless you disabled PM in snd_hda_intel module).

That said - let's revert this; this is what 1st commit does, the 2nd
commit is somewhat optional - it removes helpers introduced to implement
this muting, as they are no longer used.

PS. Don't forget to have this backported to LTS kernels, please.

Jarosław Janik (2):
  Revert "ALSA: hda/conexant: Mute speakers at suspend / shutdown"
  Revert "ALSA: hda/generic: Add a helper to mute speakers at
    suspend/shutdown"

 sound/pci/hda/hda_generic.c    | 63 ----------------------------------
 sound/pci/hda/hda_generic.h    |  1 -
 sound/pci/hda/patch_conexant.c |  2 --
 3 files changed, 66 deletions(-)

-- 
2.39.5

