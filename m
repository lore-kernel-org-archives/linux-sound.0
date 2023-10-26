Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFEAC25B48
	for <linux-sound@archiver.kernel.org>; Thu, 26 Oct 2023 11:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjJZLfp (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 26 Oct 2023 07:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjJZLfp (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 26 Oct 2023 07:35:45 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E63A1A6
        for <linux-sound@vger.kernel.org>; Thu, 26 Oct 2023 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698320143; x=1729856143;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wNYMRIG5scyAdTJj4MaccPslwOpU48pDFon17ftDxSU=;
  b=WsFPgi9r3mRPBxRYG6EFOzwinNtUTOSGYmVhbcsCKIF0OceYZF9DfOp/
   Gpv3AViYowUmyhPDGRuoQzU++efBXooHpbeGdAbZe49DCuzixYCl9mD0J
   RYXnGezaiXSt88cGmvhY/Yl/1hsHM3FHlTl2wETo+s4sgV29LH58mZYFO
   JssMUJmVZECU4AzY0NMODLEIrV90KBQGyPOcv1IGTvfoEeWNWNQQj5Nrt
   8JSIZyAwmOxdmV5FPMwBvY3iflWpYO5r5yCe1dBJZg3uojznjvGPjxJvF
   lwRjvldLjzN2o04SiSMnsYvoRtkr7fllPEDA/M4mavtcjKnW5EiUrYCN4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="473760824"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="473760824"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 04:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="417432"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2023 04:35:05 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ASoC: dapm: Simplify widget clone
Date:   Thu, 26 Oct 2023 13:35:49 +0200
Message-Id: <20231026113549.1897368-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

New DAPM widgets are created based on a provided template. When cloning
the data, the name and stream name also need to be cloned. Currently the
data and the names are initialized in different places. Simplify the
code by having entire initialization in one place.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-dapm.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 4e2beda6f9bf..b0503bf050db 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -320,7 +320,8 @@ EXPORT_SYMBOL_GPL(dapm_mark_endpoints_dirty);
 
 /* create a new dapm widget */
 static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
-	const struct snd_soc_dapm_widget *_widget)
+	const struct snd_soc_dapm_widget *_widget,
+	const char *prefix)
 {
 	struct snd_soc_dapm_widget *w;
 
@@ -328,13 +329,19 @@ static inline struct snd_soc_dapm_widget *dapm_cnew_widget(
 	if (!w)
 		return NULL;
 
-	/*
-	 * w->name is duplicated in caller, but w->sname isn't.
-	 * Duplicate it here if defined
-	 */
+	if (prefix)
+		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, _widget->name);
+	else
+		w->name = kstrdup_const(_widget->name, GFP_KERNEL);
+	if (!w->name) {
+		kfree(w);
+		return NULL;
+	}
+
 	if (_widget->sname) {
 		w->sname = kstrdup_const(_widget->sname, GFP_KERNEL);
 		if (!w->sname) {
+			kfree_const(w->name);
 			kfree(w);
 			return NULL;
 		}
@@ -3629,20 +3636,12 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 {
 	enum snd_soc_dapm_direction dir;
 	struct snd_soc_dapm_widget *w;
-	const char *prefix;
 	int ret = -ENOMEM;
 
-	if ((w = dapm_cnew_widget(widget)) == NULL)
+	w = dapm_cnew_widget(widget, soc_dapm_prefix(dapm));
+	if (!w)
 		goto cnew_failed;
 
-	prefix = soc_dapm_prefix(dapm);
-	if (prefix)
-		w->name = kasprintf(GFP_KERNEL, "%s %s", prefix, widget->name);
-	else
-		w->name = kstrdup_const(widget->name, GFP_KERNEL);
-	if (!w->name)
-		goto name_failed;
-
 	switch (w->id) {
 	case snd_soc_dapm_regulator_supply:
 		w->regulator = devm_regulator_get(dapm->dev, widget->name);
@@ -3767,7 +3766,6 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	dev_err_probe(dapm->dev, ret, "ASoC: Failed to request %s\n",
 		      w->name);
 	kfree_const(w->name);
-name_failed:
 	kfree_const(w->sname);
 	kfree(w);
 cnew_failed:

base-commit: 3edc85e3bfcb411da6e48a38e8de578f9fd71340
-- 
2.34.1

