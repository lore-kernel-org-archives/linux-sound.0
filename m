Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323137F314
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 04:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865295; cv=pass; b=sXyt726wEi+gqwMxIY7RPt0muOKm6aPP9ihvG+PVJUIddzqVZaJnkqIwrM7VPN5YB+fDczMrZvY7SyGrplxrZsWqE0D03jkT/XsSMbKhv6PFyaaXPEqPCGsiZ26cXss+CJsnJpJAvBS6Xh17a/DIEALTsDFsu2sT/0yNI3yB7R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865295; c=relaxed/simple;
	bh=s6UERuIWoDc23HHG9uQ4eEESgIt4iH+Blk1X9q9b2kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAGMAsK8k7cQ3bl6k7s3Ee78zAEJy3n2n1pdGJgE5MSu4yaVNhbB/aNW5/M/NaoYfKyOkR8uT69e+2NL+A1eh5D0y/fOCn//m36o852g6ku/Lh2IVR/GsGlxkYAIVqyNloCdSWFi2WEDtPIRTCVEAaL/oz1uXP4nd9bs/LMEgDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/iUKqay; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/iUKqay"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-885cf67963eso18032627b3.0
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 21:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791865293; cv=none;
        d=google.com; s=arc-20260327;
        b=BL35rke4o2XojBEUzdrIvuxaN25v4w4QBLoD8w0iqIRwYuUSA2pFNqnGdwfwYmt2cK
         P82HlWfSJbUCXzbcc0RR5yhAirg3kv0hXWe8plibCf49EDw/K48YbD9BsclFuXGQyxnq
         cXjFVVqB5uEQo+dr3mLr8lkjKNof6nsevWFFP6LyJQ5ALxg+C+7oH4G2GmgevP6sbxt8
         aCmanWwrKR0w0kfto+Tdt1v0fUFwQgUYet+HPjVroCWcvaaM0TWUyIhtbu4QZg+9H+qI
         anNhPOajwekHo3Dq1LbgPcLnNkWWI5gT13ogk/Xrh9/GIg21MhTu+RK+R2dtarJu+P6W
         YczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Byz8hLuIFGODwKQmN+c/5DL2ZzQd5PPTnUrY1jrei8M=;
        fh=D2HXu5Kypw6xE8I2UuH71VjD/traf/l05S+Lb8LpWXc=;
        b=fJvD87zjf2G0nV4YD1sW1pspC1LZUKItLvgwx9gf7vJk+4EKqZyX6uD+5ZTrrXZGzY
         iXDASI20a5iAMFBRcD8hlBu+d7QCoCmunUOiJ9YAz6aH7tn7Bybm2oWOIoRSFOccf/T+
         Exgi9kI8sKrs3MS6e65M0A8/xduQqKy9kUFtoL8oOi6yGh/qSKdhdKttzKPBtaWcHr88
         dPIvuy5laQK5creNCzKhSbBnIiVw2R6h3uIDC+GqK0piW6RfOz5RiqYNlE0jNSqYd3GU
         26JbgIYuxLaUcHRZxzRerDocw5Nen2uPNRgurMbbclkHB01zyOJhKXKsNa0G4ZswGEgH
         dacA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791865293; x=1792470093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Byz8hLuIFGODwKQmN+c/5DL2ZzQd5PPTnUrY1jrei8M=;
        b=X/iUKqayOrni2RSLR8J3ye2dKrmgJ/sKiq6aqyY9RSVCAlDiPJ/jnGKXWaMPSb//SI
         ZNerg1GjlG0AyQneWn2K32/xBfQSnaOfge451CcEABy34AotzypaqsAYr2qCMMEcWOmR
         tV9uI8xaGq8DvPviWHU7GLIAW+8CyMuc67WaiS7VQP2Wxy/31SFTxpsl/EajHkF5QCtU
         gZMBSH528AumYRVzxxE3ub6ef68I3jGzhYup7J4MJ+hTjUScrViRT/G8o+HZeCp7CPIT
         LNxvw8SbdgQFjZzkbMzsqccZHFSG6GraGHOZrzyEwIuLIlKFaU+XSn48t2dtxzUlzwbs
         0oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865293; x=1792470093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Byz8hLuIFGODwKQmN+c/5DL2ZzQd5PPTnUrY1jrei8M=;
        b=OJ9IhlRa5JM8FjIn3bSbj1hBhy6GCbWTOASgDZ14OP2RzivMg9mIifM0LsOZsOaQcI
         csUzaDvWxVssMbth9dG7PQ30yDLHuzy98v/SHhCKRHW8lWC3YzzjcNfCoTAtXQyKPJ2e
         bo18r/muc3xUtvhJBuGzMatNfYOddvMB1XAqraMyPQs/WNZs+gTYD9osEPXTFHHCJ/td
         NBWVqrezBmqqt75u04cNY+BNqlAYZEKzR/guuZQ+FqYjYDoI36Ik16BYqa/f3bvV9jpd
         ale5064+H3cQuXcfepmyrlglag6sXLJdAnDQzx/offD7AHIsWEcbP8X2LhZ1SrtzId1C
         +8nA==
X-Forwarded-Encrypted: i=1; AKwUvBwaNIXH3UDgpq0dflX/oCRnlBZP/YekUxX8yyzO6pBNXHv8RTQ3sDYpNwAt95N8JtoVQjY7iCc4UZGDgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHoeaQvMdFT3uZGa3NDPnhKA+ZK8knJpmMJxG2RA+ObgbXaVPt
	sDBJz+FT/EKQ3TlwcwFs8bbyu+3LbV8e+w6gsOYhG/eDBQDTVQRUQ8Y8xhq3QPFXYdAtp8TokI9
	nYCb7bxMyUEyLldLRXlPExJJIGyflbak=
X-Gm-Gg: AYBFou2qgRUxSNC2ByrtMxXrzaXfdDhPCPNXMzsmzvSauqF6g50bgIh/SDi5G8gNcqv
	yJWPAVACc0M8STafMp4PVUT9cYmhnQfnkgf5T7CkbBv69znOdCpQuu07EGuH1IwkPQ7M3JCClrh
	bwFf5rFtWtJBsntUE+TOLmXBGkHfO/0O4lU3M2MuJMokJMUgNrDcP6Es8Fe9VkPevqJAg26qZ1v
	PeWJVdL5oCWo+LQxv2lv8zdO0yYMyVtSvq38GcyzXGHLjnhIw8elOikqXwlf6rdJClC4aT8vmk2
	gzM+JjtUkTbd7oXTjbvOVqRl62CBIuuQdnz5SEKgFH9c1QBPcPZgFoPM5co=
X-Received: by 2002:a05:690c:a198:b0:8ab:3918:33d9 with SMTP id
 00721157ae682-8b07ee95c60mr33697657b3.61.1791865292925; Mon, 12 Oct 2026
 21:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-e1e7490bbe7ba1b3c44a-v2-3e3b6315a18c02ced60d@gmail.com> <871p9vidio.wl-tiwai@suse.de>
In-Reply-To: <871p9vidio.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 13 Oct 2026 12:21:22 +0800
X-Gm-Features: AclHuK83wFlFYzm55EIvTBGXeeWIPJbNgZM5v-29wnWvI2eGvDEShmghRE24n20
Message-ID: <CAFRLqsW7Y8YZok60ezLw9WKDXQMWd1=3NDQ5fxAoa+dotFRAUA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: jack: Remove debugfs before freeing unregistered jacks
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, kees@kernel.org, 
	blum@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8812=E6=97=A5=
=E5=91=A8=E4=B8=80 15:28=E5=86=99=E9=81=93=EF=BC=9A
>
> Could you verify whether the problem still exists with the latest
> sound.git tree for-next branch (i.e. for 7.4)?  There have been fixes
> for the races at the disconnection, and snd_card_disconnect() became
> already mandatory before the release.
>

Thank you for the review and pointing out the recent disconnection
fixes. I checked
sound.git for-next at 8d70e364e866. A potential remaining issue is in
the cleanup after a failed HDA codec rebind on a live card. The call
paths below show how a newly created, unregistered jack can be freed
before its debugfs entries are removed.

For the generic HDA codec driver, jack creation follows:

  hda_codec_driver_probe()
    snd_hda_codec_build_controls()
      snd_hda_gen_build_controls()  [build_controls callback]
        snd_hda_jack_add_kctls()
          add_jack_kctl()
            snd_hda_jack_add_kctl_mst()
              snd_jack_new()

snd_jack_new() creates a component in SNDRV_DEV_BUILD. With
CONFIG_SND_JACK_INJECTION_DEBUG enabled, snd_jack_kctl_add() publishes
its debugfs files. Even though the card already exists, this newly
created component is not registered yet.

If a later jack-control allocation fails, the error returns to
hda_codec_driver_probe() before its snd_card_register() call. Its error
path reaches:

  snd_hda_codec_cleanup_for_unbind()
    snd_hda_jack_tbl_clear()
      snd_device_free()
        __snd_device_free()
          __snd_device_disconnect()  [skips SNDRV_DEV_BUILD]
          snd_jack_dev_free()

snd_jack_dev_free() unlinks the controls and frees their snd_jack_kctl
attachments before calling snd_jack_dev_disconnect(). By then the
kctl_list is empty, so snd_jack_remove_debugfs() has no entries left to
remove. The card-level debugfs directory has not been removed by a
snd_card_disconnect() call along this cleanup path.

Best regards,
Cen Zhang
