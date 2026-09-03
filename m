Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0E1401A0A
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 11:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434007; cv=none; b=N/qQF0YWjsUKOTMmWdX6nEWWNhg+kLPHzMANR90W2th2EESmmBxQuS455+XlucVMaaWHF2m/+t36bb9/4dQCo10uSjTgp5XdzveRGeHW31RxHjX0QYVsSJvDcRjIbli2fVFHbbNRdaiVpNBQsmu6a/Zd1DAMRf9Kvk9WT/qCGHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434007; c=relaxed/simple;
	bh=QleeC+wZw7COGJX/pg/g2Bo1xiTYLcERNCBumHK72JU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AOhxnUVrJog0ocwxdmk6gijjVzHhnUpqv4GpVZYLJr+CIiJToWTBu420aJSHMjwYD5TmfmIG6s4E/m2xZaW9DvBOEpcivTzpq1FY4cdL7jgjYX5cuY3HRe/fCOSQ0WaOAZAcse2de0zOjplbNJRipHfc4Wrq8d5XPhk+ugie3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ndxJPptm; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ndxJPptm"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 683BCs9923503613, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1788433974; bh=XVJJhf9c5okBHzCu8NHNHZlxLB+76/hGFjc3KhKR+2c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ndxJPptmMYHLo/lcG3IhsxJlgOt29pOjxUwEU8Rqd0HP395kTzSISJWvPHRMeMrsh
	 orjoRE1xjtHKoRiGjiEzCcIfZj1wMxf4PEGP6nBoB+ItkYKj4YGW3uyjQRyaCLzD+Q
	 tbCsE7Lori1JdMkbQ8xc1ogdAWNfP+6UKBRN+xs1NExc+8sY3bK+XqDqsZ1apJDTFY
	 zjX08AMw56OtL8gvkvEejVkeTUsBYi03CRYm134ROm4nzDPuO+M3a1DkO/4E2TVGUI
	 7oUJjhBnVBF+iSHmGTfEFHAcWwQN2G6+MTVDfkhU0OEcPmbRGB2g6JLDjf5IlmD9tp
	 b5RIEVe0nrgdg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 683BCs9923503613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Sep 2026 19:12:54 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 3 Sep 2026 19:12:54 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Thu, 3 Sep 2026 19:12:54 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/3] ASoC: rt766: fix uninitialized stream_config->type and remove unused variable
Date: Thu, 3 Sep 2026 19:12:49 +0800
Message-ID: <20260903111249.3830208-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

The stream_config variable was not initialized before being passed to
sdw_stream_add_slave().
This may cause unexpected behavior when configuring the SoundWire stream.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt766-sdca.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt766-sdca.c b/sound/soc/codecs/rt766-sdca.c
index 64d763b96a06..5a1c1e10e6d7 100644
--- a/sound/soc/codecs/rt766-sdca.c
+++ b/sound/soc/codecs/rt766-sdca.c
@@ -936,9 +936,8 @@ static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt766_sdca_priv *rt766 = snd_soc_component_get_drvdata(component);
-	struct sdw_stream_config stream_config;
+	struct sdw_stream_config stream_config = {0};
 	struct sdw_port_config port_config;
-	enum sdw_data_direction direction;
 	struct sdw_stream_runtime *sdw_stream;
 	unsigned int sampling_rate;
 	int retval, port;
@@ -957,7 +956,6 @@ static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	/* SoundWire specific configuration */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		direction = SDW_DATA_DIR_RX;
 		if (dai->id == RT766_AIF1)
 			port = 3;
 		else if (dai->id == RT766_AIF2)
@@ -965,7 +963,6 @@ static int rt766_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		else
 			return -EINVAL;
 	} else {
-		direction = SDW_DATA_DIR_TX;
 		if (dai->id == RT766_AIF1)
 			port = 12;
 		else if (dai->id == RT766_AIF3)
-- 
2.54.0

