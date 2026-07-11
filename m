Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83243A6F0B
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783769989; cv=none; b=UQ5fIvYcMiJqJL4mKuDY7QXdlDAGVX3O1umyAjE0PRAQHfe4Ujq49XLd+Ykycfr5Z/NAiSNw57ZxCCCz4ADZUJECHhnTmwzlZzibFxrqjYOSFvapmxDbALuBIILSFods+JofJs/xWezYitC/ha9UNHPNy+RwQZPmxx2mvN6FlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783769989; c=relaxed/simple;
	bh=0h+eMXw/kfLWugCSiijk6RrUkOgLb8fXGrBDBYxoGwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4FdPr8G5rkw5RBUTH92MkKne66jEchSvcTvyhVUpOnQ06bKS6mTPGurfnaao5hsTpCiMTwuF+0A2Wo9JaHPz+ITlj7HmNMQ9N7oP6lEgX37DEK9ZWpBStnBbyeCp+8xIIQ5fEBP0MYv2dTYlkND8ysKApj6969MS0PvMACcwT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0z3J/xs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0z3J/xs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47dec32798aso1799518f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783769986; x=1784374786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjbNk6EtrHaZnnL2B59jNPMm165JgqnkuXclu5z98Bs=;
        b=K0z3J/xsRPisTJH/q8a9JCJcH5dAb56dHb2jZU8nKfy184rVR2TmbYLFZsOtDTNQgv
         qL8TU+2kY9AB0OYqkUM1qE6w6wBMMVYXLaVWW34X4tbMMTd4UZ42wK2WYMq0uKyDdULm
         A97VLHQ31H+1JpaUC9Wl21usrI8cyFp6BdWjRsqQIuE9Ve8eoP64HTzuwL01ylxCiEBV
         d5mZCJGLf1jzwY6RMxH9Owic9K6cK0V7MbnE8VLUxOTrB0vjRdTN6ujcxIjgRlg0RF4t
         H6MurWvkD0merGFo9N9jbNFvuLWyqEzx/ExEXWyLgiwXSOjFQ1QF7sz8zmfm2lLnRhxs
         AmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783769986; x=1784374786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjbNk6EtrHaZnnL2B59jNPMm165JgqnkuXclu5z98Bs=;
        b=ajstQVbEw/muJUJ28Fg8r6DAUgJdzqC1zwJtpfQ8XtmHBkPZJbJYvvY233NnhQrcKS
         1qQWBqXzxh6MNSmiwpnacPUOItF9TJTqUQRYFtgl50xd0FuNrd1K8OjqNFZUbJ/xaXbY
         cuES07mYaxiE65E3HVN2WS0H02RyGpvdYYEF+uLQklP0py18y8Dhe93ytjolFsJ5+hBj
         SE4+zpQEshniVbRcRlhKUiZsBwXAQuBkc2mVOusKkTl4qCd6HcRpleNkxWfC5H6TRWcm
         JYTxas7SnZL2iIxkKKRx3hGLnH/XctM7us7F3PcHYFcPUK/wHNnPQjJcpO4WpLRnW8VH
         D/1w==
X-Forwarded-Encrypted: i=1; AHgh+RowRGliQD5Bkb2LR1YP5QEw6ScYOLgHcN6jVhmHFks3p9pEgAumj3Ni63NB5dBfreAaPkO3usxIni+Vfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLI7HiW2lLnHzwi/HicID8IVfWBjnx8ITnaAjqP/sDrqlYYfSS
	s+G6/YsYX4US9hh+Q7IT/hRRAr24NVFIi4TCfGaq5qTnpoNwhsujBe4s
X-Gm-Gg: AfdE7clUgANr6eFVQyJgfVXcL1pLQ/AlkVUpEsFbk5V+cVtsLrwa0bDbMI3fOzkdSF8
	mEtgWeZKxVMLeuDFRz6Jp8oREhoyqkKW2jQtLXsy9UNmgzMwpw4Aju52eDNQGYjHDIhSujmDFW5
	8QqYweJgrKI1kVhjwPJh/pYH6nS6ftI7WdV3PNzP17KjFwnTXfth7X+Uf4eel6vl8ZsJ1CkUci6
	yjN/nAVdTrgicBG5M/rcrFxWZKV3k0vixqZy1qlCkeHGTTPDdj2ze7Nsnhoa6vl1NFqYXeBkfrQ
	YXqk8YlnIad4JWDeGhGM17ssnizbskvJZO3PtuF88wuZcMoFJAMioATRoah6zinuMqKdiFZl9Bi
	OaBP/bMa60igoumbqXXuxEAoz1uLfKvEjbn+ihsAY4sWueADMBa+cVgVe/K+W3Fvb54r9R5OCSw
	MCTYMlYqMzaIDLhz2hjbXO+bfSaZG4
X-Received: by 2002:a05:6000:2305:b0:47d:eee8:ec40 with SMTP id ffacd0b85a97d-47f2dcd717dmr2491274f8f.38.1783769986131;
        Sat, 11 Jul 2026 04:39:46 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:e106:f973:a70:bd1e:4000])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm62817520f8f.31.2026.07.11.04.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:39:45 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: "Wang, Sen" <sen@ti.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add TAS2557 mono smart amplifier driver
Date: Sat, 11 Jul 2026 13:39:36 +0200
Message-ID: <20260711113936.71958-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <e3ee8a6f-dcd7-4205-bd3d-da34a1b9aa14@ti.com>
References: <e3ee8a6f-dcd7-4205-bd3d-da34a1b9aa14@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +	unsigned int asi_offset;
>
> Why does asi_offset need to be computed in both hw_param and
> set_tdm_slot? Shouldn't setting it in one of them suffice? AFAIK both
> func ran once per stream request.

hw_params() was computing a default unconditionally, clobbering
whatever set_tdm_slot() had set. v2 adds a tdm_configured flag:
hw_params() only computes the default when set_tdm_slot() hasn't run.

> For the firmware parsing, could we possibly reuse/extend the defintion
> headers from
> https://elixir.bootlin.com/linux/v7.1.2/source/include/sound/tas2781-dsp.h#L43

Checked tas2781-fmwlib.c. Same magic (0x35353532), same TI toolchain
lineage, but the formats diverge past that: tas2557's header carries
DDC-name and description fields tas2781's doesn't, tas2557 has a
mandatory PLL block stage before power-up that none of tas2781's
parser variants have, and tas2781's parser is built around its
multi-amplifier device-index model that tas2557 doesn't need. Not
sharing code between the two.

> If write failed hw_params should return the corresponding error code
> from ret no? Right now hw_params will return success regardless.

Fixed in v2, both writes now return on failure instead of just
warning.

Gianluca
