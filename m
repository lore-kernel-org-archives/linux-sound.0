Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA423C9891
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 20:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985786; cv=none; b=AxL2g8wXY9+o556nuQwFrjtY2srU4HUaQYVPkXxOqxCAGn0+kus/1Y9A/SxPQotEwKXyibclxH3ygIVzXqPSMgVRhz9kNdTVkBV7ydEU7Xjg2ZBiyAfs8AnZxFOsY9uRNA6QYpG4qtJ9C33b4b4R/BFGHLkV2I3a5RfUWYkO940=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985786; c=relaxed/simple;
	bh=n2O3OIrAFdMmFr0yu/uaSut1SXnpXWM1clMCDkvIz4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=URkOgiLCYV5DoOBb148ms8kg6+mJlA7MM9kvnaRbs25rDB58hRrW4qtoxB1E7vPJJjKi7TTVOOJ48Wh9LUCf1jkIRnvfO9BNNKvZGo2NZo9lUsjQl0qUh1SAIhcYsjY1SGqSI6CbVehaZR+y8NwP/Fg6Y/etsGI2vr5HB2iHcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJZ/KFx4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJZ/KFx4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso62130645e9.3
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985779; x=1789590579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=TJZ/KFx44v+UViRzLR0kAbzUjkD34nLHd7nh7cjoz2P4FUsNjpjtrcwIfrE8ne+UVy
         AZp+n0hjllq7BK0rP2Us/OFfd8ShsVCDVFGUKxYtDOVuQe0NholSuwuRLjugwYcRiq6Z
         7ra/84LU7ycnAewMBOfuFxjjgB/VHk+j4KqmpzMShX8e/TZbyU9lTNe14/B0o+uxPgCr
         MPzZ7rd17jAF4i9DiMuQwL0wpPg5MhZy3qE0JEraB2LM6CYHwqcE2/H0nGslrPfYAwzO
         szCktNIMZ69atida+RWdfFNbfEcqZPfOPg8H39i0fy0b9xd5u9TVMBLhgNXmqAElDtoE
         /O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985779; x=1789590579;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qckaQ07GIjAycth+WTbJjXIHu8VJsW0kggwIpsbAbME=;
        b=UtN642S9V+YtiP1Sqva/BOKv973WkOlUIThNwqI/lb1m3Op0j7mwpk8ptPcIjvMtip
         bsyOTuwzaXPCpFGYBRwcE+SgTxberBWSOdS7+Wg3BxBYSbflQDWCIOsiJO7JrfJhWLUe
         riwoktJ5E17KtmhFZYn0Z0H0WfyvdIZ6Tvyqcybr6xBZxT+CsqrEL/MVkQtoPcwaN9xF
         tXuLAeDMldOqhQHPPeClD7gE9/wG1BTPHISAZaVP4SwBLaDixdfpVNkyrwCfw53qhAOp
         3pyngslJgw/hAt4CbQ6BKPNdKjiklQBUEHOs9NFRSIY4dKnIJKPpVplLA4H5FAYHDxDa
         A+NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGQbAZ9SBeTlN8tRXrz/5WDRQDF0ZCCQwyChxL5FaUxwLfcI9zEZzlgb5cAsWKQus7wuLQEtKQamQlcA==@vger.kernel.org
X-Gm-Message-State: AFuF++kTjEKxIJ255SOGIVor0OeT6384ZWJr/vkrxFyqnXoJu2f9tDjT
	afXl0NxsNmSXjpVB4YvWXNiKX1Rpmd9BRlti4qr7/zp1kIXl4Nw3UeEA
X-Gm-Gg: AYBFou09h8ce4jnpSz8kPQ7bEQdsYBsZxIUXvMTTSzhDQ1Ui8dDdNu6k7leG3D5KVIq
	38Y1XKJ7HaQhkCH8j0esAmp8lr6zaSK4+HUu+b+LLssY6ssmFWX8Bns3ndqlvhOQpRDlIHXQniB
	ooB4h1Bdaup4BUfqyxZJdVeR65FHYxbgu7P7h8CRufcsWdR2z6dHyyLRVFhCLoOEQ5gVqw0nRiE
	gNPxRnrw/zOggivvsgFfN9Rm/wpPtIA367SqyIL2+HuK0FxHIpIaB3GhvZIu3tKBsKelrmE2ay6
	V9XCfB8c1sx8NPVAaxZFfuHBB09l0mLFjE438GhCCeZZ4Kl1qsSM+Ts13ZVRw5ZGEBzmel6mnSn
	MYV9i8zdhuO1lkt5UzZXTcPYhui2ibLZGCaatNHnMikdfBwp6T5C9pt/9XiOHikrmA/AE/Qs4uy
	1umfMp3hmAPgB4NGm8EHx2ll/p+aXv9Nb4ZXqlmEVgX2Ha0ezlv7jgx/wAoJ8Rz1uPSO98cCl9h
	+swxjM673CwVHuL+ayfDamwRQh8w/3xH7YEyH5w/IumyN0e49J5kCzX4svUhBKiJQ6aQFOQr0Sq
	Fdk6egm5HKVbFfeqYjTA1sWkMel7A4BS7nOpXMOOV5+hm/RI6Jr0U80/HO1JTjEG+EOmpQLvupZ
	Lh/Md6NtYfleiQOI9
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr2796585e9.15.1788985778747;
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26b7332asm16723565e9.0.2026.09.09.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:29:38 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH v2 0/2] ASoC: SOF: xtensa: prevent stack OOB read on DSP panic
Date: Wed,  9 Sep 2026 23:29:31 +0300
Message-ID: <20260909202934.37644-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes a stack out-of-bounds read affecting all platforms
that dump DSP oops/panic info via sof_print_oops_and_stack() (i.MX,
AMD, Intel atom/bdw/hda-dsp, MediaTek).

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a loop that walks the flexible array member ar[]
in struct sof_ipc_dsp_oops_xtensa, using plat_hdr.numaregs (a
firmware-supplied, unbounded count) as the element count. This only
works correctly for callers that allocate room for ar[], such as the
Intel IPC4 path. The IPC3 callers listed below allocate xoops on the
stack with no room for ar[], and were not updated when the loop was
added, so numaregs walks past the buffer.

Patch 1/2 fixes the i.MX handler (previously sent standalone; this v2
includes it in the series after an automated review pass flagged the
same pattern in five other handlers).

Patch 2/2 applies the identical fix to amd_get_registers(),
atom_get_registers(), bdw_get_registers(), hda_dsp_get_registers()
and mtk_adsp_get_registers().

Ștefan Ghețu (2):
  ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
  ASoC: SOF: Prevent stack OOB read in the remaining DSP panic dumps

 sound/soc/sof/amd/acp-common.c           | 1 +
 sound/soc/sof/imx/imx-common.c           | 1 +
 sound/soc/sof/intel/atom.c               | 1 +
 sound/soc/sof/intel/bdw.c                | 1 +
 sound/soc/sof/intel/hda-dsp.c            | 1 +
 sound/soc/sof/mediatek/mtk-adsp-common.c | 1 +
 6 files changed, 6 insertions(+)

-- 
2.53.0

