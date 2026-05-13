Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E858383C6E
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 03:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642095; cv=pass; b=NYHggnHqifXafQYyDCGD7miMtiv+PJ9N2Ak256DDWedKbcfJZ0ipF8jWh8D0QsKAK+zradL6B0ZQDASwFNAJmDx9Nh8H2duLs2tXnRR1lkN25P3TrgM/XcSBXSkiuko+WYm7BuO+aYJpWGEdoYRTU1jUXyjd/FNmB4QI1yHhaZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642095; c=relaxed/simple;
	bh=NfKjw4OH3cZc9vx5/lhcJtqmI4I79M2cvfhxFcHCX3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qDjBq9cfpmUYBZNNea4xMAF521bgqZOXTPVKmLjWnIp61GvHWREQSkdndfaAjeoN2PxKkkxPHjDKjZauHqIba4Pc2cYzvfeeaLKEELW0vweziuRN1ar6NseM0rymgmyLNhloTXGWRWaewxEvnqyFj9K70k9rcFuRO4WWIqST5+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoU8BiPS; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoU8BiPS"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-366330b6751so4143546a91.1
        for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 20:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778642094; cv=none;
        d=google.com; s=arc-20240605;
        b=ZVJtroLE9JjOS8Cv4Wu7tKSON2+dl4bf43y1Dfk1b90MXdzCnx6HHZ0UtxWrEnhxBL
         XfN1cPFvgGtnscVbzkGS10NddKzRyKdTT0rPEc6gywosD1DE3oSK5KUZyyGPvNN0ASeZ
         jBewKnw09zsEtdCSfJ75oySvkYXTF1rBwSolEPYMVPt3QI1gn3ur50SsVdbpe7FATaM1
         S25m5c8vxWzM+wgeQ98K6E6OIYvc0eiDEwpkSQA8DTouPHN6onPuQHpum+/frmZni5jw
         2Z9un8qdjpFvVvrK0f2aoxIelTLVhgZ45NCjfTs2BDkzVocMvefbtHmzCiWZzZGH9x02
         ScOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CYlVJgBMJMBSzC9+QqB70POzR/0T9ox9YRqJAIrAuGo=;
        fh=V2XfHGF1ITDvBB/IXRN1K+STKqxKCVR7uGZGlg0Lgng=;
        b=WKvLCvL4geD5wXnAuG/9vOuN6H+xti7Hrr2eMN21SCU8ACEBMZgs+TDitm+j4KOFPD
         O1ue1RBBFW/rcEVWB3MQ0nh+LWIVBLg/rugeBto82pn83Er2ngaIMs+i0cr1mCr1tBfe
         QLp0OeE+742sRLmqNYwOWTJGdZHDyWQCZY9ckEv51hXfj4ehBxX2y8LqChc4hCuaNCiP
         zvAiqfOKxsxJ+a9faJe7M5U7NlbPx3BJ0tn55rl0bNEY3nTmfzj1c3QNd1jrjibu7ld+
         ysP9LFzkF7rtYK+goa5KX6Ii8OkcVyNQwWwze86ww4UWao8KXX6Jc6srvrEL7URLBBzx
         vV/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778642094; x=1779246894; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CYlVJgBMJMBSzC9+QqB70POzR/0T9ox9YRqJAIrAuGo=;
        b=YoU8BiPSQjAF2RxzCuMLgIdUl0lLoqS84iXP8IiingE8LFuozIiqGyIMhF7NwWX0dA
         0hpP65SZDBcg4jVO+XJrH3txGPhR5IPYjoiL8dEaoK6powWQiTDw0DSB3yve0hUH04wt
         RjAoBTXB9uekOptZiwcDtEP0jnFSAKDs7NJCOX3Nr/JtideJr5UmzI6fqyAyAXmCeCon
         f4gSxijFfdXsEFyWAj2wkiSDbt9icjgT2W/Q97i1T/U3xfMRusjIpYjJXYG3H3EmFQdn
         DUpGvobJE3DxvVHWpt9Jh8PhofWa61W9p9JpJ9MC2z0vXu88pAcMNLBY2RPkb/L6Bf1I
         QOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778642094; x=1779246894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYlVJgBMJMBSzC9+QqB70POzR/0T9ox9YRqJAIrAuGo=;
        b=YKlZw+1BnkrgfIAaa6OQHspYPL1lvrWQxcTagk4jP7cHpNnr/LQBH9Iw+jFdC+cVUP
         eNFecODzIRgsHDDpMD7buaKqQRrudXgFFwzCnadgKa9eHjUnKqmVBxIWB7DlXOdERLa3
         qJsrPVzNyOmwmmH0duXZ/X/+eWJ/4V9UxV819fU9FCtZ8R6mx+sKlpZ0xqINuCPajmyE
         JTgx63e1nrZNoTZXGdqk/RzmlGR23ea0oitsmKehMUegQW22QhXju4cgeaZdqKnmY6mT
         cHLdEJUTDUHUCHPqdNy1RFpsxLAFinWVLpwSbHAjtlCz+OiN1tszqV5nFhEgsPDak1Ea
         TFfA==
X-Forwarded-Encrypted: i=1; AFNElJ/fNwa95RgqqZIttt4DfDST9uuMI+IB9ESf3wpofyaM101VmhIf+aEYnzC1wVKLMq1/Y/odzYLdamSffw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdUGeAqV9/lkvdKJMvaBayESXqAQbEJWaV/tvlJEDOmb3LWMWN
	DDD2OwTqWR1Ev7xPsUrqhaMFFEwFaW+OOkEvjDa6EnFGY7ZCSw49nQFVBEu2sz/8Im9NusK82QE
	od14KjhPSzjZ191vMv1VUfpxza+7/BG8=
X-Gm-Gg: Acq92OH0hZkNwO5A2F0WXSL1JcpvbbABotI+vChDvJ9ch+akK5ab6FCQkJxvl2McCBG
	XsoPI3gP7TzAOa4Fa2m9epmvwyMh78yEe7YYIiKt3AYAEpvDoD9NMA8dWH5EY9JecrGUOhda3dA
	uAEXcvSI5wFQkyLZCS4IeJY92jByFZXZTvnAnw5z6PnIOMQTks8SBQ9AZUfdkPHG9BdJRizFaKc
	Xc56dRDNs2U+1rEv8kj/UQta/LacSHYQZ/4kW+g1nHBcD7eQ0tC36yrEQRNuYEyMtAdsvMgulKm
	wQigb7LuFcmr2IozeweAYNyayc47Tlf2oS65Cg==
X-Received: by 2002:a17:90b:3907:b0:368:1088:bb1d with SMTP id
 98e67ed59e1d1-368f79946bemr1029956a91.15.1778642093964; Tue, 12 May 2026
 20:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
 <20260508103837.138142-8-phucduc.bui@gmail.com> <af_g24kqkm4QhDuU@sirena.co.uk>
 <CAABR9nH62K5qqujXzr_HwT6F0V1ezzENAVnjqqu3zrMvmCYWbA@mail.gmail.com>
In-Reply-To: <CAABR9nH62K5qqujXzr_HwT6F0V1ezzENAVnjqqu3zrMvmCYWbA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 13 May 2026 10:14:42 +0700
X-Gm-Features: AVHnY4KWCVXMXRBzhAxelHPQRxBLjCfp-EOJxWzIat9M2x18913Y6relP4HsudQ
Message-ID: <CAABR9nGHO+q5BUmUtER_tcC1drz3bBap-+=pew2+JBKYsg_6Pw@mail.gmail.com>
Subject: Re: [PATCH 7/7] ASoC: ti: omap-mcbsp: Simplify lock and resource handling
To: Mark Brown <broonie@kernel.org>
Cc: peter.ujfalusi@gmail.com, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, jarkko.nikula@bitmer.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

>> This function now mixes scoped and goto based cleanup which cleanup.h
>> warns us not to do - are you sure this is a good idea?

If you'd prefer to remove all goto jumps from the function,
I can prepare an additional patch for that as well.

-------------------------------------------------

--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -322,42 +322,40 @@ static int omap_mcbsp_request(struct omap_mcbsp *mcbsp)
                                  "McBSP", (void *)mcbsp);
                if (err != 0) {
                        dev_err(mcbsp->dev, "Unable to request IRQ\n");
-                       goto err_clk_disable;
                }
        } else {
                err = request_irq(mcbsp->tx_irq, omap_mcbsp_tx_irq_handler, 0,
                                  "McBSP TX", (void *)mcbsp);
                if (err != 0) {
                        dev_err(mcbsp->dev, "Unable to request TX IRQ\n");
-                       goto err_clk_disable;
-               }
-
-               err = request_irq(mcbsp->rx_irq, omap_mcbsp_rx_irq_handler, 0,
-                                 "McBSP RX", (void *)mcbsp);
-               if (err != 0) {
-                       dev_err(mcbsp->dev, "Unable to request RX IRQ\n");
-                       goto err_free_irq;
+               } else {
+                       err = request_irq(mcbsp->rx_irq,
omap_mcbsp_rx_irq_handler, 0,
+                                         "McBSP RX", (void *)mcbsp);
+                       if (err != 0) {
+                               dev_err(mcbsp->dev, "Unable to request
RX IRQ\n");
+                               free_irq(mcbsp->tx_irq, (void *)mcbsp);
+                       }
                }
        }

-       return 0;
-err_free_irq:
-       free_irq(mcbsp->tx_irq, (void *)mcbsp);
-err_clk_disable:
-       if(mcbsp->pdata->ops && mcbsp->pdata->ops->free)
-               mcbsp->pdata->ops->free(mcbsp->id - 1);
+       if (err != 0) {
+               if(mcbsp->pdata->ops && mcbsp->pdata->ops->free)
+                       mcbsp->pdata->ops->free(mcbsp->id - 1);

-       /* Disable wakeup behavior */
-       if (mcbsp->pdata->has_wakeup)
-               MCBSP_WRITE(mcbsp, WAKEUPEN, 0);
+               /* Disable wakeup behavior */
+               if (mcbsp->pdata->has_wakeup)
+                       MCBSP_WRITE(mcbsp, WAKEUPEN, 0);

-       scoped_guard(spinlock, &mcbsp->lock) {
-               reg_cache = mcbsp->reg_cache;
-               mcbsp->free = true;
-               mcbsp->reg_cache = NULL;
+               scoped_guard(spinlock, &mcbsp->lock) {
+                       reg_cache = mcbsp->reg_cache;
+                       mcbsp->free = true;
+                       mcbsp->reg_cache = NULL;
+               }
+
+               return err;
        }

-       return err;
+       return 0;
 }

------------------------------------------------

Please let me know if this looks okay to you, and I'll prepare the patch.

Best regards,
Phuc
