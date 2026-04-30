Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4177C429806
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557972; cv=none; b=NRfy416zGa2hlSc7CO4eOrI2525KpCBMFA/e4TWuuzLHXntYo0ezBZSAWthvBsUwNngwc61Z5YHlrszj522ptO9D9511XXUeePCOSEwROZpuyJCLqKUoSUzwmLl6O7hxwfyLRuiw/LfUqFlv4B3ap9agpx8oXdmnW2/10TRjNKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557972; c=relaxed/simple;
	bh=tmhrNRjGE46qGeWDsWSeSCEPefzkAKEH4PTvfLc4d3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NMu1wF+Bpx2h6DobAWDsZNfQim679OAMYj0L+28G4Qeh/iOEukmlrHx4tfWL+S/eLRmDj8DbApV9SYDQ+uIjj19Y8zrOJ/UzqgfDXDUWYmktoB2ZYrB7X4UqlQ4qjHt9Hn5lrebdhgTe5xx25w8FGXGsInMCwL+3TZhOHYp4ppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNOabM1w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNOabM1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777557970; x=1809093970;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tmhrNRjGE46qGeWDsWSeSCEPefzkAKEH4PTvfLc4d3U=;
  b=bNOabM1wiB6D4vTVCPLdWKbiUDVhhlmirTlIcYiNv21QD+mY7oECFsYS
   WkaHMGLinZVZLTO1WDftFjpoqzUfgnun4i4QIG/NBqHiilm1++ZXWDFOf
   IXDesktiI5g4zpHtCPJM7QexW6JKdg1E1wNvkUAfLqFJUS4vB9PtaN5Mk
   Osb7UW5OJTaaqBUlczqwfa4Fe1zkriywbqtN+mH8GcsRX2SW8kveURAHH
   sSakyUFfyLlXLb3kbxmMI7FbpOIHo3MCykziPlj/sSuoe92gFTt6gzMxs
   umtmK5yT3zHEubmtiNhjbx+QT4jxkQ+rArFcOsCGsRCvPwXTcgbk6aBBX
   A==;
X-CSE-ConnectionGUID: lUMSj9LkRq6LzK5UGhUVlg==
X-CSE-MsgGUID: BVUuP+L/Que5m0j4a6xP4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="89198542"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="89198542"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 07:06:09 -0700
X-CSE-ConnectionGUID: kQh908ObTIye7AOSui/n7A==
X-CSE-MsgGUID: IMxBzgkcRSiUhplAm/oi8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="233560830"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 30 Apr 2026 07:06:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ASoC: core: Move all users to deferrable card binding
Date: Thu, 30 Apr 2026 16:07:52 +0200
Message-Id: <20260430140752.766130-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
completed the feature and at the same time divided ASoC users into two
groups:

1) cards that fail to enumerate the moment one of the components is
   not available
2) cards that succeed to enumerate even if some of their components
   become available late

Given the component-based nature of ASoC, approach 2) is preferred and
can be used by all ASoC users.  By dropping 1) the card binding code can
also be simplified.

Flatten code that is currently conditional based on ->devres_dev and
convert snd_soc_rebind_card() to call_soc_bind_card().  The latter is a
selector between managed and unmanaged card-binding behaviour to keep
non-devm users happy.

With rebinding being the default, devm_snd_soc_register_card() takes
form of its deferrable friend - all the devm job is already done by
devm_snd_soc_bind_card().

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

This is a direct continuation of subject [1] begun by Kuninori with goal
of simplifying the code related to card rebinding.

[1]: https://lore.kernel.org/linux-sound/87eck7k868.wl-kuninori.morimoto.gx@renesas.com/

 include/sound/soc.h    |  2 +-
 sound/soc/soc-core.c   | 44 ++++++++++++++----------------------------
 sound/soc/soc-devres.c | 28 +--------------------------
 3 files changed, 17 insertions(+), 57 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a30f95ff7d86..f0935523c8df 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -425,7 +425,7 @@ struct snd_soc_jack_pin;
 int snd_soc_register_card(struct snd_soc_card *card);
 void snd_soc_unregister_card(struct snd_soc_card *card);
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card);
-int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card);
+#define devm_snd_soc_register_deferrable_card(d, c) devm_snd_soc_register_card(d, c)
 #ifdef CONFIG_PM_SLEEP
 int snd_soc_suspend(struct device *dev);
 int snd_soc_resume(struct device *dev);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e70bf22db5c9..ec141b810b50 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2165,6 +2165,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	snd_soc_fill_dummy_dai(card);
 
 	snd_soc_dapm_init(dapm, card, NULL);
+	list_del_init(&card->list);
 
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
@@ -2308,6 +2309,10 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 probe_end:
 	if (ret < 0)
 		soc_cleanup_card_resources(card);
+	if (ret == -EPROBE_DEFER) {
+		list_add(&card->list, &unbind_card_list);
+		ret = 0;
+	}
 	snd_soc_card_mutex_unlock(card);
 
 	return ret;
@@ -2323,12 +2328,15 @@ static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
 	struct snd_soc_card **ptr;
 	int ret;
 
+	/* The procedure may be called many times during the lifetime of the card. */
+	devres_destroy(dev, devm_card_bind_release, NULL, NULL);
+
 	ptr = devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
 		return -ENOMEM;
 
 	ret = snd_soc_bind_card(card);
-	if (ret == 0 || ret == -EPROBE_DEFER) {
+	if (ret == 0) {
 		*ptr = card;
 		devres_add(dev, ptr);
 	} else {
@@ -2338,21 +2346,11 @@ static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
 	return ret;
 }
 
-static int snd_soc_rebind_card(struct snd_soc_card *card)
+static int call_soc_bind_card(struct snd_soc_card *card)
 {
-	int ret;
-
-	if (card->devres_dev) {
-		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
-		ret = devm_snd_soc_bind_card(card->devres_dev, card);
-	} else {
-		ret = snd_soc_bind_card(card);
-	}
-
-	if (ret != -EPROBE_DEFER)
-		list_del_init(&card->list);
-
-	return ret;
+	if (card->devres_dev)
+		return devm_snd_soc_bind_card(card->devres_dev, card);
+	return snd_soc_bind_card(card);
 }
 
 /* probes a new socdev */
@@ -2550,8 +2548,6 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
-	int ret;
-
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2578,17 +2574,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 	guard(mutex)(&client_mutex);
 
-	if (card->devres_dev) {
-		ret = devm_snd_soc_bind_card(card->devres_dev, card);
-		if (ret == -EPROBE_DEFER) {
-			list_add(&card->list, &unbind_card_list);
-			ret = 0;
-		}
-	} else {
-		ret = snd_soc_bind_card(card);
-	}
-
-	return ret;
+	return call_soc_bind_card(card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
 
@@ -2909,7 +2895,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
 	list_add(&component->list, &component_list);
 
 	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		snd_soc_rebind_card(card);
+		call_soc_bind_card(card);
 
 err_cleanup:
 	if (ret < 0)
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index d33f83ec24f2..718165ba84ac 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -49,11 +49,6 @@ int devm_snd_soc_register_component(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
 
-static void devm_card_release(struct device *dev, void *res)
-{
-	snd_soc_unregister_card(*(struct snd_soc_card **)res);
-}
-
 /**
  * devm_snd_soc_register_card - resource managed card registration
  * @dev: Device used to manage card
@@ -63,32 +58,11 @@ static void devm_card_release(struct device *dev, void *res)
  * unregistered.
  */
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
-{
-	struct snd_soc_card **ptr;
-	int ret;
-
-	ptr = devres_alloc(devm_card_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret = snd_soc_register_card(card);
-	if (ret == 0) {
-		*ptr = card;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
-
-int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card)
 {
 	card->devres_dev = dev;
 	return snd_soc_register_card(card);
 }
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_deferrable_card);
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
 
 #ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
 
-- 
2.34.1

