Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33E6E55B
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760764; cv=none; b=q16sn7SOZmmLbiW4QKn40MARo+OT8M3kfotjDk8xHtWmwG9y5qYGDM6qnvdO+k7VZlCvPUl9TealVrIWf88gAJxRMujvT9DC92mCmKxDC3feaGh0YpOmSBQEfk4l9AB1msxj5z5K4qv4y1DP2+1NCXA+2nuznC36C2+dn6WSe3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760764; c=relaxed/simple;
	bh=Zbmct3Mf1PnWoWLJH4tOGqRLoKDzawDRylbKSGCN/o8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=s/MkTBw4W4eU5wYZkSXfbVuAeZSkjpAX0WFGS0UDqkWFtpZasLdNvY6WmTxAjmyQnx5jcK1NP98F1121IBSUS3WsM2m02QeYGcnoTZLh0C1eHN+NhTGsyjf8l6NsX2dBtkI0T8mr1wjHAY9npehx09e8cmJ0xCGLWg6Lt+ihBc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9hi95aj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9hi95aj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743760762; x=1775296762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zbmct3Mf1PnWoWLJH4tOGqRLoKDzawDRylbKSGCN/o8=;
  b=V9hi95aj8RVv6b0PLVu65qXVyv3YiAhyeHlL111EOtrt8jPAdu60kKdm
   Miw7Fwfjvf+PeZ3Cd2gfwyjj+66EDafCDb2jX2sq8jbXTel3cYFQQwQdm
   6nGVx17LS/wq/5UkwhzPR41zHng/qLNxW4C52LYRrQfVl3ExsuKr8ChHz
   XP2uKZmrhUoCrn+tOPytan+qOiGMwPKiqGQKHkqlSolTqk5AbRSiu4bW/
   AuEROV3MEQWPWjQFgOnB7LadBqIlcYWBjnhbSI/MWdlGvgGvExsjkfz2s
   oahD6vNZWR0gYkkGOD1Ig/yhSFiW9yY5AZ3xeb1Pkr8lup4stquaX6RvH
   g==;
X-CSE-ConnectionGUID: WUPWff70RUq4qOeEnWdl5w==
X-CSE-MsgGUID: MZ8HrPw4RtmZsAeR0hy67w==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47909193"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="47909193"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:59:20 -0700
X-CSE-ConnectionGUID: xn3qSenTQTe51ZZoRyhRuA==
X-CSE-MsgGUID: BSnaSaJXRDeXt3Z4QVl3jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127163667"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2025 02:59:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: core: Complete support for card rebinding
Date: Fri,  4 Apr 2025 12:16:21 +0200
Message-Id: <20250404101622.3673850-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit e894efef9ac7 ("ASoC: core: add support to card rebind")
there is a support for card rebind. The support is only partial though.
Let's consider the following scenarios both of which aim to enumerate a
sound card:

1)
    snd_soc_add_component(comp1);
    (...)
    snd_soc_register_card(card1);

2)
    snd_soc_register_card(card1);
    (...)
    snd_soc_add_component(comp1);

For the sake of simplicity, let comp1 be the last dependency needed for
the card1 to enumerate.
Case 1) will end up succeeding whereas 2) is a certain fail -
snd_soc_bind_card() does not honor unbind_card_list so even a non-fatal
return code of EPROBE_DEFER will cause the card to collapse. Given the
typical usecase of platform_device serving as a card->dev and its
probe() ending with:

int carddev_probe(struct platform_device *pdev)
{
	(...)
	return devm_snd_soc_register_card(dev, card);
}

failure to register card triggers device_unbind_cleanup() -
really_probe() in dd.c.

To allow for card registration to be deferred while being friendly
towards existing users of devm_snd_soc_register_card(), add new
card->devres_dev field, and devm_xxx() variants for card registration:

	devm_snd_soc_register_deferrable_card() (external)
	devm_snd_soc_bind_card() (internal)

In essence, if requested, devm_snd_soc_bind_card() replaces
snd_soc_bind_card(). The rebind procedure takes care of destroying
old devres before attempting the new bind. This makes sure nothing is
left hanging if binding fails and card becomes unbound but is still
registered to the ASoC framework.

To allow snd_soc_bind_card() to be reused by the deferrable friends,
move 'client_mutex' locking to the function's callers and select between
devm_xxx and non-devm_xxx variants of snd_soc_bind_card() based on
card->devres_dev.

On top of the feature, the refactoring brings two benefits:
a) single lock/unlock of 'client_mutex' in snd_soc_add_component()
   instead of ambiguous unlock and immediate lock in
   snd_soc_try_rebind_card()
b) all unbind_card_list manipulations done under 'client_mutex'

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h    |   2 +
 sound/soc/soc-core.c   | 100 ++++++++++++++++++++++++++++++-----------
 sound/soc/soc-devres.c |   7 +++
 3 files changed, 82 insertions(+), 27 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 952ed77b8c87..484d8b3a34f3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -423,6 +423,7 @@ enum snd_soc_pcm_subclass {
 int snd_soc_register_card(struct snd_soc_card *card);
 void snd_soc_unregister_card(struct snd_soc_card *card);
 int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card);
+int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card);
 #ifdef CONFIG_PM_SLEEP
 int snd_soc_suspend(struct device *dev);
 int snd_soc_resume(struct device *dev);
@@ -1087,6 +1088,7 @@ struct snd_soc_card {
 	unsigned int fully_routed:1;
 	unsigned int probed:1;
 	unsigned int component_chaining:1;
+	struct device *devres_dev;
 
 	void *drvdata;
 };
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3f97d1f132c6..ab615ec113d2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2134,18 +2134,13 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 	}
 }
 
-static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
+static void snd_soc_unbind_card(struct snd_soc_card *card)
 {
 	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
 		snd_soc_flush_all_delayed_work(card);
 
 		soc_cleanup_card_resources(card);
-		if (!unregister)
-			list_add(&card->list, &unbind_card_list);
-	} else {
-		if (unregister)
-			list_del(&card->list);
 	}
 }
 
@@ -2155,9 +2150,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	struct snd_soc_component *component;
 	int ret;
 
-	mutex_lock(&client_mutex);
 	snd_soc_card_mutex_lock_root(card);
-
 	snd_soc_fill_dummy_dai(card);
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
@@ -2304,9 +2297,49 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 probe_end:
 	if (ret < 0)
 		soc_cleanup_card_resources(card);
-
 	snd_soc_card_mutex_unlock(card);
-	mutex_unlock(&client_mutex);
+
+	return ret;
+}
+
+static void devm_card_bind_release(struct device *dev, void *res)
+{
+	snd_soc_unregister_card(*(struct snd_soc_card **)res);
+}
+
+static int devm_snd_soc_bind_card(struct device *dev, struct snd_soc_card *card)
+{
+	struct snd_soc_card **ptr;
+	int ret;
+
+	ptr = devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret = snd_soc_bind_card(card);
+	if (ret == 0 || ret == -EPROBE_DEFER) {
+		*ptr = card;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+
+static int snd_soc_rebind_card(struct snd_soc_card *card)
+{
+	int ret;
+
+	if (card->devres_dev) {
+		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
+		ret = devm_snd_soc_bind_card(card->devres_dev, card);
+	} else {
+		ret = snd_soc_bind_card(card);
+	}
+
+	if (ret != -EPROBE_DEFER)
+		list_del_init(&card->list);
 
 	return ret;
 }
@@ -2506,6 +2539,8 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
+	int ret;
+
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2526,7 +2561,21 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
 
-	return snd_soc_bind_card(card);
+	mutex_lock(&client_mutex);
+
+	if (card->devres_dev) {
+		ret = devm_snd_soc_bind_card(card->devres_dev, card);
+		if (ret == -EPROBE_DEFER) {
+			list_add(&card->list, &unbind_card_list);
+			ret = 0;
+		}
+	} else {
+		ret = snd_soc_bind_card(card);
+	}
+
+	mutex_unlock(&client_mutex);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
 
@@ -2539,7 +2588,8 @@ EXPORT_SYMBOL_GPL(snd_soc_register_card);
 void snd_soc_unregister_card(struct snd_soc_card *card)
 {
 	mutex_lock(&client_mutex);
-	snd_soc_unbind_card(card, true);
+	snd_soc_unbind_card(card);
+	list_del(&card->list);
 	mutex_unlock(&client_mutex);
 	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card->name);
 }
@@ -2753,23 +2803,19 @@ static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
 			stream->formats |= endianness_format_map[i];
 }
 
-static void snd_soc_try_rebind_card(void)
-{
-	struct snd_soc_card *card, *c;
-
-	list_for_each_entry_safe(card, c, &unbind_card_list, list)
-		if (!snd_soc_bind_card(card))
-			list_del(&card->list);
-}
-
 static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 {
 	struct snd_soc_card *card = component->card;
+	bool instantiated;
 
 	snd_soc_unregister_dais(component);
 
-	if (card)
-		snd_soc_unbind_card(card, false);
+	if (card) {
+		instantiated = card->instantiated;
+		snd_soc_unbind_card(card);
+		if (instantiated)
+			list_add(&card->list, &unbind_card_list);
+	}
 
 	list_del(&component->list);
 }
@@ -2808,6 +2854,7 @@ int snd_soc_add_component(struct snd_soc_component *component,
 			  struct snd_soc_dai_driver *dai_drv,
 			  int num_dai)
 {
+	struct snd_soc_card *card, *c;
 	int ret;
 	int i;
 
@@ -2838,15 +2885,14 @@ int snd_soc_add_component(struct snd_soc_component *component,
 	/* see for_each_component */
 	list_add(&component->list, &component_list);
 
+	list_for_each_entry_safe(card, c, &unbind_card_list, list)
+		snd_soc_rebind_card(card);
+
 err_cleanup:
 	if (ret < 0)
 		snd_soc_del_component_unlocked(component);
 
 	mutex_unlock(&client_mutex);
-
-	if (ret == 0)
-		snd_soc_try_rebind_card();
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index c6364caabc0e..d33f83ec24f2 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -83,6 +83,13 @@ int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
 
+int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd_soc_card *card)
+{
+	card->devres_dev = dev;
+	return snd_soc_register_card(card);
+}
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_deferrable_card);
+
 #ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
 
 static void devm_dmaengine_pcm_release(struct device *dev, void *res)
-- 
2.25.1

