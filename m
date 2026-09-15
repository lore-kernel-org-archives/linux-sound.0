Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A8915746F
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434425; cv=none; b=e4HTzYwezEGU70luvj7DLI5ocIR2fYqOheCzsiTfzP+CWzwkdcXJ/CvEJfERRONKrm5UJc2MLAshAERNsKJxnMlMTC0NC+Ij5bE7WKpvNwHr1DQsEt0VWtabaze5LEGozWNcOLOT1l24tnIolPcDlUQiZNOaM9lPj8PIn3iYGVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434425; c=relaxed/simple;
	bh=iIyopcp0Eg/79/p+GJ1lsh5nK7teNzKfmi2LjYujHxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfI3dc736pPlJ7mFhzPdVyMuVaacQKYkjCkZZsn/3jZdk48EZRoxEzq1zztYdvCSubSc8yCSCvt4veOBQ0CcKDc97k2G+gv/tFpKNDJ7RIoV5WjmXShDTIwgQ+LBrP4/wMOfIfPsEbyIcRq5oUIhUFCLMo8xdlFmURKE4U+UNXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOSFGeoW; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOSFGeoW"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso1927285a12.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 18:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434423; x=1790039223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVj6epRXvsPg58PK1Nw02taxzApo/fNJ7ozze0TGnPo=;
        b=AOSFGeoWvSDjDyLnPU1zsuYbTRxJsY8envzx1tP0fWXzOGoHDsbQOKZaNN7RVaqnkw
         GHrb3zLL60BbWZu/DPsvJ9Sos9QB56byniLppDz2qIL4bAbIH5fZH5HupV+VuLqGmaxd
         C/MLJiJr/ELLS3e49sXURewhStHW8b3P8M1/oxkZeaV0ApM/kSwOugxX399k3Uih9Gbl
         7VE29RfLFuKGRFbJ4qvCdxzhqapBLMwhneWVTcTIiJy6dUWkgjYIyE2bNemRyz1u5PlS
         5ySiX2F3Zoj5zVBVb6aroquiniDl+U9W3RC70qNXWOSxfWHtChyu4sOMUN8N6oPcs8ha
         xJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434423; x=1790039223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVj6epRXvsPg58PK1Nw02taxzApo/fNJ7ozze0TGnPo=;
        b=JTMOk8KP3l53hnGSdcabebWIbMb9fmJdL55OU4AtV0KdDffeCVaPEltArGr9ZB2jnM
         XioF2nJeOkpxTaMQp7tHpDsYDjCLiXZyHc9HrCN3Q0lTJFt/VVQkWucNBojCSmNa2u6F
         kLd9/nx7rOc8gyyJIEgtF2PTl3GZrXsYDBPTLCHO53cIeo2O1syx8tBUDCuYvN3ByqEM
         0GMblAAGR+rGOL+bPJTXd7i5b/hZ7XHRqvLxrdCDVxEvHlsh3su/FjopY/482CgWjeqg
         QHrGSp0s+rVLG5iHtjxZPHCgk0+6fCi0oCzFamoBZxODa/77BiEuAevyydXcQkGADcOm
         /3GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY+dqh72Oi1K6hedHURxldOXS2DAi0bKdrVXFeUODcjXSuEz9PoJNpBziX9MHmDS752bTwo6JjC7k/+A==@vger.kernel.org
X-Gm-Message-State: AFuF++lf2k/ETorwaX39HALjNY28VCYzXXB+QBuKxbiGkawaYgLzRDa1
	JVpbIHYMen3AKIQhBbAHosszFnDKo2FHplu0n/HnVyIewpTRBnDsLjht
X-Gm-Gg: AYBFou3usDns71MsHqZg67mkSCr76F+Mzp2cXBbAO5mDcqt466HbpHd3/stoXdb9N+l
	Z+zTgV11grVk32J0ROOZROjeDW4cL2xOBq2OKO7RLaAh0VOETLL7rYRiiFbCCTxKl8HTzukz35C
	nQuCmVZKOjQ90vJk+toJAjEy/Hhj9pFS5TMFxhmMwP/EhP6hhLvzZ7bcbe5Tf4uK2npZFrhWbOK
	16EKxpg3sYtxRxEFFj5EImw1Tmb3A78YrjO9ys5LT0v7n9B98OIdMvpxIULpH7w7xqpA8U9ZLfn
	0uoWUzAKQbau31zaB2ihXGzpdEt1inkNhdrOILJQlF4r3KYQxaOV/lWcpRu88k+9WaKY8x72Uht
	5nLV8eys6SC0F5o8U6fU3ntZur50FaQ6hUKorV41TfBIE7MQtxABKtDGyES5DizSibrjdmGlLOx
	jTqHVlsxGciC2+58lBPi2RGn2Y/Gfkww2WoNHUd8mqmt9U//wOTv/9PUK0VtfgR3ZpYCKUcV3uL
	d5riuHlcd0N2L3v4xIWvjfYVuy9I6BV9lwugCqE+TcqyFA+u1TXkRWzLbVtNlkWCN9QwvxZypz2
	w/L30iRrLBJt/o7wY4cboH0Ew8Hzxptj5O3f1EzcKbWw3YdcergYE7WjOvbivbVH
X-Received: by 2002:a05:6a21:3a94:b0:3d0:cc29:ff63 with SMTP id adf61e73a8af0-3db404f44a7mr13467755637.12.1789434423035;
        Mon, 14 Sep 2026 18:07:03 -0700 (PDT)
Received: from rithvik-nitroan51557.tailece47.ts.net (23-93-86-111.dedicated.static.sonic.net. [23.93.86.111])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33be20c67b7sm3077346eec.15.2026.09.14.18.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:07:02 -0700 (PDT)
From: Rithvik Vibhu <rithvikvibhu@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rithvik Vibhu <rithvikvibhu@gmail.com>
Subject: [PATCH v2 0/2] ALSA: hda: Fix Acer Nitro 5 AN515-57 mic switching
Date: Mon, 14 Sep 2026 18:06:55 -0700
Message-ID: <20260915010657.36140-1-rithvikvibhu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <871pavol7n.wl-tiwai@suse.de>
References: <871pavol7n.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thanks for the review :)

I reworked the fix to use gating in jack.c. I believe this is what you
meant, and will fix if not.

Ordinary gating still requires the microphone pin's own presence bit.
On this laptop, pin 0x19 can report both false presence after S3 and false
absence after reinsertion, so gating alone does not cover both failures.

Patch 1 adds an opt-in mode that takes presence entirely from another pin,
using the existing gating relationship for callback propagation.
Patch 2 uses headphone pin 0x21 as the source for headset-mic pin 0x19 on
the Acer Nitro 5 AN515-57 (1025:1539).

Based on sound.git for-linus at:
c9e6e5f38bf75276605f1952b22285f5f3abcaff

Previous submission:
https://lore.kernel.org/r/20260904231545.33505-1-rithvikvibhu@gmail.com

Thanks,
Rithvik

Rithvik Vibhu (2):
  ALSA: hda: Allow jack presence to follow another pin
  ALSA: hda/realtek: Fix Acer Nitro 5 AN515-57 mic switching

 sound/hda/codecs/realtek/alc269.c | 25 ++++++++++++++++++++++++-
 sound/hda/common/hda_jack.h      |  4 ++
 sound/hda/common/jack.c          | 83 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 110 insertions(+), 2 deletions(-)
