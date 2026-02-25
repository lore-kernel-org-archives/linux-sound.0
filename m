Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7011C3D1CAA
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772027419; cv=none; b=ZMEzU+cPg1FLSZYLGxIJppMsEvDUMgAYLbj07A3fuvLQSyVTZ36yMgkz7O/KV048vqULOqsex6u361VYN/9QjKSuo3+s53W5V8Cr9dMNoPa/qxPBkKhMqOnmkl7KtjLbRWuAaaE2zPKuliBYOqx+0Xws7YJf3ujtuDqaXBaALlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772027419; c=relaxed/simple;
	bh=gD4WSo3s+A7/Ebu6wiA2udjuEmR/O8lnQU4siN3nv/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YaT+A8wYDc+HcyLr9hd2qJSmH9z6Rj/KuEo5/Xc+yF/K8o/1R8cTtngWfZmefQ/Zs/I/8MIWJY5iXrRgK1eBvjingdPZiIC6qD5+tPOcfJHhi88k4wfNpW/xF+xxi3ajRFvjvkf6xOlGC4P/gbmQk6QtekLQDsYHREIJwlYlKJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAtX5obo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAtX5obo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772027417; x=1803563417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gD4WSo3s+A7/Ebu6wiA2udjuEmR/O8lnQU4siN3nv/Y=;
  b=gAtX5obodpN1vMXb03iH41A0tQ3OunkWdt9RvGhN+rwVoCVqS71kiqRy
   GCUkCGws8B9Mhkb+t8vbBi0orb1K2J/Iq47db1CH6Ka+0GYlbTdCmBOF6
   zykvyG8ld9RhztyZWfvNQUlB3PGhCCIeaXWITK/Yvdk/8viqZ8Hrpso6l
   +WBUzejrLzf058JivxzVm5i1WQY9Q6i/qHlGeRfKwUidVfjMOFBiFczqr
   AzM5JFmBHYkMyy6meOwe0oseVXOspelUPMX6omYO7Uk7OQu5vKswxX3p7
   h4C62wxMgIYwOKWwFkAMijdgsiZz/S4xxNfwI0ECQjkW3IQTCV9Yo8UI2
   g==;
X-CSE-ConnectionGUID: BAnJ8Af3QhKVuyFdLQmFow==
X-CSE-MsgGUID: Hxcq0RAoQrGVpGnt/DFBYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73037433"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="73037433"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:17 -0800
X-CSE-ConnectionGUID: /kRmKHl5TUmPlHSBpzvZjg==
X-CSE-MsgGUID: oVlgp15sTDOctUcLXAszTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="214352126"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 05:50:15 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	Deep.Harsora@Dell.com
Subject: [PATCH 1/3] ASoC: add snd_soc_lookup_component_by_name helper
Date: Wed, 25 Feb 2026 21:50:02 +0800
Message-ID: <20260225135004.2322987-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
References: <20260225135004.2322987-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a helper to help user to get the component by name.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7d8376c8e1be..1a486153dc76 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -465,6 +465,7 @@ struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
 							    const char *driver_name);
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name);
+struct snd_soc_component *snd_soc_lookup_component_by_name(const char *component_name);
 
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d0fffef65daf..f41ca5109a6a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -404,6 +404,19 @@ struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_lookup_component);
 
+struct snd_soc_component *snd_soc_lookup_component_by_name(const char *component_name)
+{
+	struct snd_soc_component *component;
+
+	guard(mutex)(&client_mutex);
+	for_each_component(component)
+		if (strstr(component->name, component_name))
+			return component;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_lookup_component_by_name);
+
 struct snd_soc_pcm_runtime
 *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_link)
-- 
2.43.0

