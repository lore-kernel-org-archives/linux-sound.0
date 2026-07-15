Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FC5171CD;
	Wed, 15 Jul 2026 00:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073936; cv=none; b=e/8xHWRkdBQgl1hwfr19ztibCxF3/7LFJk8dbbzaXg6/8NFaVVzmxE6yjVvzlZdSToC3EMR7W6erFggw8pJAimg8QKHUJFC/hR6Mvf8cgsScd9IWyOzl/B7diXp2FWZTW4I84c1TmlB02Xr0HLpU++h1yrZ5fVSWMOlLq2i52fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073936; c=relaxed/simple;
	bh=djb+ywngkl0XQ41FMIoGIecHgkGePLB3dRFHjIcOKUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvBExgZGChaf/JUIz8ieFjXQdfZ08OeRFpxDw/QgWzagt4ikPITkBQ1fm71zzLIaJhJt3fBeaVe5/yImMb8t9mAxQD54yD1Emw1ZWR7Oz0gL34bTvOMALnTbfntAcYL+t4DLMejraeVvoepEvh5OxZhkIARKEjNB7UIuiEhelwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KNj/zD7F; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KNj/zD7F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qywkd8idYdvwcUR1m71kYoz3a59q0zRNVKzYSgEtA9I=; b=KNj/zD7Fx+byxAHjGzT/PmtJAt
	iJNI/inZGAEQmMcUW4YDjyq06wv/hStJYRbqMJUehG5fvzi2v60yYmt+Bp2twMtiBeeJhZ2rIcBW7
	e7pNIBzwyUCPcZasQOD6WQZAufDE7FZlkpXF2+yPhnFtDT1L9PS3Vj+4HAjv++oE5FTDbyMqBP9Zk
	EPO8YusvLGEb6Pgi2cnmGWsyx/7B41IjSDAfqU3+/0BHzl+3W2lDTCLxNMix0UIGfZyvLE4TOOylp
	Gu3IJPeQKj1CJ1TLqMFxEh5Z1tmggWokxLOqa9LjrgfAfRMRRIxQj41536cCb7m6OMdvH34XKDttR
	loQvnQkQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn81-0000000DTcu-3kdc;
	Wed, 15 Jul 2026 00:05:33 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 10/14 v2] ASoC: SDCA: correct enum names and add a missing struct field
Date: Tue, 14 Jul 2026 17:05:21 -0700
Message-ID: <20260715000525.739874-11-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715000525.739874-1-rdunlap@infradead.org>
References: <20260715000525.739874-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a kernel-doc comment for @is_volatile in struct sdca_control.
Correct 2 malformed enum names to match the enums.
Fixes 3 warnings:

Warning: include/sound/sdca_function.h:306 expecting prototype for enum sdca_set_index_range. Prototype was for enum sdca_fdl_set_index_range instead

Warning: include/sound/sdca_function.h:829 struct member 'is_volatile' not described in 'sdca_control'

Warning: include/sound/sdca_function.h:1152 expecting prototype for enum sdca_xu_reset_machanism. Prototype was for enum sdca_xu_reset_mechanism instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
v2: add Rev-by: Charles

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: patches@opensource.cirrus.com

 include/sound/sdca_function.h |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/include/sound/sdca_function.h
+++ linext-2026-0710/include/sound/sdca_function.h
@@ -298,7 +298,7 @@ enum sdca_xu_controls {
 };
 
 /**
- * enum sdca_set_index_range - Column definitions UMP SetIndex
+ * enum sdca_fdl_set_index_range - Column definitions UMP SetIndex
  */
 enum sdca_fdl_set_index_range {
 	SDCA_FDL_SET_INDEX_SET_NUMBER			= 0,
@@ -803,6 +803,8 @@ struct sdca_control_range {
  * @mode: Access mode of the Control.
  * @layers: Bitmask of access layers of the Control.
  * @deferrable: Indicates if the access to the Control can be deferred.
+ * @is_volatile: Indicates the Control registers are forced to be treated
+ *  as volatile.
  * @has_default: Indicates the Control has a default value to be written.
  * @has_reset: Indicates the Control has a defined reset value.
  * @has_fixed: Indicates the Control only supports a single value.
@@ -1144,7 +1146,7 @@ struct sdca_entity_hide {
 };
 
 /**
- * enum sdca_xu_reset_machanism - SDCA FDL Resets
+ * enum sdca_xu_reset_mechanism - SDCA FDL Resets
  */
 enum sdca_xu_reset_mechanism {
 	SDCA_XU_RESET_FUNCTION				= 0x0,
