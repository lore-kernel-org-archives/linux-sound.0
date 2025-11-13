Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0524325488
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022357; cv=none; b=lOAIlUGJrCyVySu0XQ8DP9pQ+etN6WoXLJVtP1NiJtoDP2821C1TCPVPpt3UYH7kCM29njtqcb7a3RGRAUGkFd/Uj/XotmybTP+FbyIG8R4bIYQNd/t/LpAwhGCZUnMmrtcel4XfTFvRGAKAO3unSV07s4YveILq2qlQ9ZwZ6IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022357; c=relaxed/simple;
	bh=WYdmv/wAmH2bGHrjDBQy2zbnL0MTLz5879jybyLc81o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBQeoSPEBFeRoSA1nHzeVL9hwnVlKq5jGvqkNILdnpK1tF/JpikzAPbnSzgJxs7/KsKdNVQNcXlyccEl1CzmHJSqTgxvRSgA9a7y3adJimrCTiKL7nG+vC6CGq67Duth1VpJNYTf89OrjSPW8aR3GjPhMyO+NEp5YfARsIabjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFawGo8e; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFawGo8e"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4234775e9.0
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763022354; x=1763627154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cj5Mpbx2CmIrOrUNCLRh4UEGcYcMlUJdEeSo8yfEOjw=;
        b=XFawGo8e55DVLjswPC5gT71u/CRUcx540DjIBfviAfhI4d27uFDP40/tF6O/Afub1d
         8NywBPJRNc+5m95v8i4/kUmc/TBs7PoGVCguYotxQiUn051QuOXTSlGIttg8/cC5oWMd
         6K/NDNsmPfiuIdOV2lyqa12iymaW9athyWDWyDVBF59g5y8prqd+s28vY/IUjdUamB72
         iGpHe4rX4VqqRJgCmMkhIavTXgB8K4aMXdyn3f2+WUoKzPKpjcDrepywYdg7TZ8CHUfh
         AM6WZfByva99vho5EwFooGOObGxXyBbF0WHoij0ju2XCEu8bqHT4eOZ3PNR18SjoWIQU
         +9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022354; x=1763627154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj5Mpbx2CmIrOrUNCLRh4UEGcYcMlUJdEeSo8yfEOjw=;
        b=fBnbwlql5KyX0m6p6w79id+j5sFOMU1L5MjX90CHAgXI8BCK1+TmM/3Ivl+tPIkV0u
         /WmIPcWscLlaEcPhoky1blKV+vynOHQRlCR+glYwYKKLdVn8vZEaIWyblwcS64k3uJtX
         895Ko9CBoj1qFDRohZKYd2ISOnmMfD1djobA9cZWzsaYWecRV1DWIe+6BLsFrNPPgrr5
         uImxzfMq0RyCJl8ViBfSUXjYFONtGPaqnrKQuMwJg2y2iO9mv3bHwbJH7JPLCkU9U5p3
         WWKDsHv/19qzZw6JtyCKu4L7QvbTfiNMOBkGfvwBiCccH9qpChSTZNoq2NyW+yu6ouHy
         5u1A==
X-Gm-Message-State: AOJu0YwyGLgX6FwaWCyV403jl3gurmcLpHa6XLt2O0cBNjwlzhal1fTK
	aqkyMgscW6Auh/qay4dOqKBlGLtQGBz5/iL/c7BzQItrdCQEpiIy4gRb
X-Gm-Gg: ASbGnctW3MyT/VC6NTpSvogp3sDn9vtbzIOnTRmKSD3MDCCpDJ/i8UB1ud8t6NtJg4z
	tH5snx0Gy1HrKqJMoX8B7MKTIR9nqrrkGG9q42rjmRjwKpi6HE+arMorhRSJ//8Fsm8Q+MaBUT5
	So8Q3r73zjekWO8qu7aiUdSkPgIUZEV33+QOPzy6Ex1tI1LTs3arz3mhOJW4/L8CGXUWkWMP8xM
	8KR3grF7FC3tbWksBGPMTLwefTbeHGY8aKmQy6eugwE5vCJt2iDUMjBAbAgGlMVfZscn4BqFXpK
	CwsDeZzpe7RkzV2zRalKFc8Ck5/uoOCADLF6hoBC3UlPpULt35BRhiW89HrZSa98wRbrnzez2k0
	s5I0EBl45Eb6XmPn/rrqjsy4vecnzfzj5bZomXtDGoJmLCa6yJZe3IBeSvPSg7qHMZ03l+MzZmC
	Z5P8xewcb9VWewZsH0kMSOtc3iHdDWfuckWUSN7JhmYn+lh0G6smYzLo2e6OL/
X-Google-Smtp-Source: AGHT+IFdUK8abWe3SfpGnIIlg1BGOiBLzAf4aJxdLNUOGmaJb0G6Z+ySoyP9XzrZjNZx01XS41rQEA==
X-Received: by 2002:a05:600c:470d:b0:477:bf1:8c82 with SMTP id 5b1f17b1804b1-4778bd744famr18919045e9.15.1763022353933;
        Thu, 13 Nov 2025 00:25:53 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb34295sm15214435e9.2.2025.11.13.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:25:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] RZ/G2L SSI full duplex fixes
Date: Thu, 13 Nov 2025 08:25:45 +0000
Message-ID: <20251113082551.99595-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The first patch in this series fixes audio channel swap issue because of
half duplex to full duplex switching during the streaming that involves
FIFO reset which drops the word leading to audio channel swap issue. The
second patch fixes sample width value in the hw_params_cache::sample_width

v1->v2:
 * Split the fixes patches separate.
 * Improved code logic in rz_ssi_start() by using else if
 * Collected tags from Morimoto-san

Biju Das (2):
  ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
  ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width

 sound/soc/renesas/rz-ssi.c | 66 ++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 17 deletions(-)

-- 
2.43.0

