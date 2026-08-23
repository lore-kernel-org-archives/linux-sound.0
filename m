Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB42532ED4E
	for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787525739; cv=pass; b=cm66dCxlwSWgLBKTC74ef3sYwkU/gO+7peKaoN0MbONs+22vTwaKn00v786VTQXPHf3clFQVyOxy6NCx6mMfuFlJ2Vvf65xkPuUxbrUI2j+P/q/3DqFWLnETmBZf5x6r26WbJ9qTty2GX/4vZ09LkLS4a+AxBs+u6OTqru0rf/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787525739; c=relaxed/simple;
	bh=lGK1jeAFEMFLYD3h6AkNgEeazz7yZVCsfJzpRwa6lJU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=EGNL/nEJMVsMVRljE0JEYW1qNlzXPPooXROCzM6r69ztn/sPbKAiL/ejKRA041jACXoVSYuv8E31//Dv5W/Tn5Y5Mq4hD9e1u49EgjYRC0fzmbeViERX9GUi4z1ugBvStvhQHow/p/ncLZ/5f/Yncc14PqCjsC+s8KRhDFHKTIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZAeFdCh; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZAeFdCh"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7ec49608332so3246048a34.3
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 15:55:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787525737; cv=none;
        d=google.com; s=arc-20260327;
        b=jAT5RFwm3w6jtpq24V5H5JxVzA3lhW+wqj/wajwaa7LfSikzsv7wQqbOTblY4qPNLW
         VipoDs5DsiOn/u0bYSarp3xYVE4WaHJMtDTFC7oXgDmnekEmBGu56dEvXD3mnemnnRi+
         2Uns4We1wCKiTQRIXm583WyT6veu3VaWd/mPJGpfkDMcoUFXH6cfltdYPJ07885j61yu
         glcPNkHnqW8LkjRiVeebPUrpBwpWTXOw9CensdVo96UQmF9fe+yrPxZwm8e249I9WeMb
         xLlRZxwoxJ7+nJcjunNicGOTcs8MOXQoQ5koM26M740zQ8kOEg9uiX9dRDaKMwYNtGvN
         yrOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6nQM6BUPRFGBmcGNWVqBmiQItuS5E5NLa7Gr9IT1OgQ=;
        fh=RQB0t50W0TgvpByp3gC87ewyPJ8Rw7Ii9E7CSeoNK/s=;
        b=G9QhSRSpGoxItQ3VJC4s22ZE9edZWNTZ9TTOHpqkAqgklmzsASNrqq03G/laLNMLI5
         rptEHjY6RPnSYmHW0QwKg2deeNHUjHG9aNGEy/aJWTUhDWfEeSzlD4CqUMDjlxR9wxOK
         Bjky8xIjyiSNCOQYn/qC1gNHEPRrnJ/RVhT/ugFadSijWJTk2ubtaEEUgIarBHzR5Gjp
         Waz7h2YzVxzbkcTDe6dC9oEWaHbZ75j/uizH2Z1fG5KHgV2eizEBQTs+35LQtqhNtBMt
         ro1N/np8ZEC4+3Eo8ewIcKaOzaWMDn8xx0wLdw77x+VJD8WYetfKzQ1R1cQka4yq/ywJ
         bOfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787525737; x=1788130537; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6nQM6BUPRFGBmcGNWVqBmiQItuS5E5NLa7Gr9IT1OgQ=;
        b=BZAeFdCh/aJGN6KWM/7dplpiBmsmlRJ3Th9d1EjP3SK8M3ocejgn2OXzX/Lfy0cd2G
         HNbZ/JMzEdHCYtYvHeNjFgrk6jw1uJzebwGz9kqr4v/GYqcFLmE1GO29iljC+Z5ddo7N
         5IYDHafxYR+nFrhe51ptAjzoFPSqLQb6WwfVWu/HX/IdgUC29ecFXiDdfHt1/Ov2E8XD
         u1v1v4BQIwRiaqJvHLh8hV8oREd8J+tq/qx1C3pey+dr4zeT123K3uEJ3YTcFyKSElA5
         8FyqTjvwTO84IIvXlkZ1MdPy8qmItgivnf+NgjxClaThXUJn/kSlWEdA95kl64QZ0QUZ
         Dhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787525737; x=1788130537;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6nQM6BUPRFGBmcGNWVqBmiQItuS5E5NLa7Gr9IT1OgQ=;
        b=knKlgZB/lqSNHEWVvDzcF6ZGGoPSjM29so9GJR+lpcEPAaeR25SqmkERVeQnAs/c5S
         KQHBcVVk9z+EypO4/gPwAI7xeV8ICLoWr1KglKBxzane5f361TR44kl4HW0nh4sqYr+h
         c1sDoQaoApPYIVVvh1/kEYh8wnDDYr5UNnsAzx2hLsP0lrRwEWrakP+c6Zhv5Kq3PsSw
         /f04VLnvZDDF97TR2yL92uMdbeXpUAKwCBV1oMCexFQ/GwhrSYk2I4cLFfV5efrUCLD8
         lqDusK0aaPHBA7laiSyqe5AoqAu46F+ZTcvnBvUmNQrlvDYi9IJ+uilBLPTYwELhL+gb
         iqlg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0XYcfbdJseLF7t0wc1EFt+w5WXqbYIi3QDmXju6lIxR726EzHgsRWs2AYjrLn8wU7YApUL7YlQO0DlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lEWJK29RHTHvRUR3PHZLYfLNzXfmm9WGUpMn9cHh3xCwLzHvt1
	YCFVv9IGQ6w0bMzxN6h/LJFuLOsJFiNRVigj6pRg2+1akKA+usOXejjWnU90dMNhD3pHJxECH9k
	YgFtTXOATIjgWrtUDO1hQRswuYYzRcmc=
X-Gm-Gg: AR+sD12WgD3h0ZvPboLk3C5Dt/7mwZgG/BAIQF4mDmvRag2Dj+rZFlL8P6xqjd9gEqN
	L5RcGblntV1WJl81BYBX5hxt1o0x2b88SgTsUO59z4c+sxrbBs2qmK3fOdBYk1VhxubV/mgkSxd
	h188KdhdTXjlIU3h859cu2JCv1fP5/dFylWzPn6TdVR95Xy2zcYxlPw2MtDujDC/+5lt8pSMN0g
	3t8MLgrOKBrnswY/Dv5MAl627EqpdvVrTvK9k8aROGsXxTKL91BXS5OQibay84HhVlPKMgIDZ3X
	jarcXvBR0ONoYDl/yyHQZ7qzHKG/FgHelETl8BW+FBx6X48Sfh61r4pCWtEGgFKKk/5FUqOrD8O
	0YXNvwpvH/6yNojCa8KaNDnzYK86hVfIy0vHuMyMk9NuJd4HzHgJtH20=
X-Received: by 2002:a05:6830:4116:b0:7f3:a8ac:45fe with SMTP id
 46e09a7af769-7f461510b2fmr23497950a34.11.1787525736693; Sun, 23 Aug 2026
 15:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 24 Aug 2026 03:55:21 +0500
X-Gm-Features: AcwNN1Uwa6OcQQNdTAM_nRZ95jY-l9IKhkHybM4SNpQAplxIwOWLSG55WHdb9h8
Message-ID: <CABXGCsPh2d=1tJzszkFFQS=WrtNh3pD+Mhv_uj9VE2w58QPQrA@mail.gmail.com>
Subject: ALSA: usb-audio: guessed channel positions on a device that names its channels
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,
I ran into this setting up a Topping M62 on Linux. It is a USB
interface with ten playback channels and sixteen capture channels --
five stereo pairs out, a set of inputs and loopback returns in. Nothing
about it is a home cinema. But alsamixer labels its playback controls
M62 Front, Rear, Center, Woofer and Side, its capture controls Mic
Front, Rear, Center, Woofer and Side, and a player that lists ALSA
devices directly offers "5.1 Surround output to Front, Center, Rear and
Subwoofer speakers" for it. Choosing one of those gives silence or the
wrong pair, and nothing explains why.

The layout is not in the descriptors. Every AudioStreaming interface on
this device declares bmChannelConfig 0x00000000. It comes from
convert_chmap() in sound/usb/stream.c:

} else {
/* If we're missing wChannelConfig, then guess something
   to make sure the channel map is not skipped entirely */
if (channels == 1)
chmap->map[c++] = SNDRV_CHMAP_MONO;
else
for (; c < channels && *maps; maps++)
chmap->map[c++] = *maps;
}

for (; c < channels; c++)
chmap->map[c] = SNDRV_CHMAP_UNKNOWN;

The standard position list is walked positionally, so channel 3 becomes
FC, channel 4 LFE and so on, while the honest answer the next lines
already use for the tail -- SNDRV_CHMAP_UNKNOWN -- never reaches the
head.

What makes this more than an unlucky guess is that the device does say
what its channels are, in the field beside the one we read:

bNrChannels            10
bmChannelConfig    0x00000000
iChannelNames          11 Playback 1

bNrChannels            16
bmChannelConfig    0x00000000
iChannelNames          21 Analogue 1

iChannelNames indexes the name of the first channel and the rest follow
in order. Reading those string descriptors from the same Linux machine
gives:

11  Playback 1        21  Analogue 1      29  Loopback 1
12  Playback 2        22  Analogue 2      30  Loopback 2
13  Playback 3        23  AUX 1           31  Loopback 3
14  Playback 4        24  AUX 2           32  Loopback 4
15  Playback 5        25  BT 1            33  Loopback 5
16  Playback 6        26  BT 2            34  Loopback 6
17  Playback 7        27  Mobile 1        35  Loopback 7
18  Playback 8        28  Mobile 2        36  Loopback 8
19  Playback 9
20  Playback 10

That is the hardware, exactly: two microphone inputs, a stereo AUX, a
Bluetooth return, a phone return and eight loopback returns. In
sound/usb the field appears only in validate.c, counted towards a
descriptor's expected length and never read.

Two questions, then, and I would rather ask than send a patch that
guesses at the answer.

Should the positional guess stop where the position list stops meaning
anything? For two channels it is almost always right and clearly
useful. For ten or sixteen it is not uncertain but wrong, and UNKNOWN
is both honest and already available.

And is there interest in surfacing iChannelNames at all? The chmap API
is positional and has no room for free text, so this is not a matter of
filling in a map -- it would need somewhere new to live, and I do not
want to invent that unilaterally. But devices do provide these names,
and on an interface with ten identical-looking channels they are the
only thing that tells a user which is which.

Happy to write either patch if a direction is agreeable.

-- 
Thanks,
Mikhail Gavrilov.
