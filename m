Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE54C4167B
	for <linux-sound@archiver.kernel.org>; Mon, 30 Oct 2023 09:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbjJ3JEN (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 30 Oct 2023 05:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbjJ3JEM (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 30 Oct 2023 05:04:12 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E801F8E
        for <linux-sound@vger.kernel.org>; Mon, 30 Oct 2023 02:04:09 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32db8924201so2659147f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 30 Oct 2023 02:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698656648; x=1699261448; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZzGNWc+IzVizqRKNlF6kXjAc0auqnWt/ZIQ282X9fE=;
        b=PqbVMhqaq9bz8nHMRCkbcFW+09QkgAocez7uR1/DuHNymJv4qmrj4QPhZhGMspDMID
         Io8OVsXfHehse+GYdQvEVwN9Rhg7yq00IVfGVDCS8l5EUvdhzAGB7u22ithkvHsJkkF7
         TxcczycrkLLtioYrQJBpgwIAdS/AnATWsumzMf0JQ2HxEtHYM6Bk763xzR8ToyOojY0W
         R59GFm5ieRSQNCUpEIBVgqEZQ4n40e6Wyo6v8qCwGICR4Vk3N/wpM4f+G8c4N6W46/uV
         mQKF+fJAc3mT5CMTLv21mPxDl1tiPDtV2qt4MUqUi5T9Q34z+2ZVv9uVhxJ6nQXw2TZk
         0rCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698656648; x=1699261448;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZzGNWc+IzVizqRKNlF6kXjAc0auqnWt/ZIQ282X9fE=;
        b=CG1yTGRLUofoaN8EQlZF3kUJ3amB0nPIri/4c1BfVfo7Wfqg252/dK53QCdK3Pr2LP
         xB5veTY5Mps3fXAZgdZNHVQjP66kbxg2OiQsigA3l+bu91hhqYOBRvQl/sUjeKGyA0EP
         rMUkQIbvLQut7CL+e9ruyM9bfa7hB1TK/J0znNJPtyemTNU7pW+c+9qoMScQi9qXi+/u
         6IYun5vDwRkzjugjEMdMuIsYlu+lNEpJFnqWSNz5OE4/ASEOGckCZ9Mtg5vLZD04/BJt
         mQkiniliphMGvNu4CpZ8MgTiyJ8kNhzbBW2MlX/Mi6NupNmnLPSHvB2R9cmd4DnZg0BK
         KwLA==
X-Gm-Message-State: AOJu0Yzlw9NDWqrNNLm8j+THyvh8WNaIGXoD+dQk9PA4kHCfSqrhIuR9
        hTY3EA0WeQKUmeI77Mho9BV7Yvb/cwqd1V6/Ykg=
X-Google-Smtp-Source: AGHT+IE7uwFyMngWVFUY7/KyLoZiHL2mCvSxRmOAVM20u+vqxRE3PsMSJ7whvV2GTBmT25DxrAAYdw==
X-Received: by 2002:a05:6000:184c:b0:32f:7bf6:db01 with SMTP id c12-20020a056000184c00b0032f7bf6db01mr5685356wri.67.1698656648227;
        Mon, 30 Oct 2023 02:04:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d14-20020a5d4f8e000000b0032d96dd703bsm7672656wru.70.2023.10.30.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:04:08 -0700 (PDT)
Date:   Mon, 30 Oct 2023 12:04:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Syed.SabaKareem@amd.com
Cc:     linux-sound@vger.kernel.org
Subject: [bug report] ASoC: amd: acp: refactor acp i2s clock generation code
Message-ID: <bd52b930-95da-45f3-ac19-b87de2938857@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Hello Syed Saba Kareem,

The patch 40f74d5f09d7: "ASoC: amd: acp: refactor acp i2s clock
generation code" from Oct 21, 2023 (linux-next), leads to the
following Smatch static checker warning:

	sound/soc/amd/acp/acp-i2s.c:59 acp_set_i2s_clk()
	warn: odd binop '0x0 & 0x2'

sound/soc/amd/acp/acp-i2s.c
    35 static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
    36 {
    37         u32 i2s_clk_reg, val;
    38         struct acp_chip_info *chip;
    39         struct device *dev;
    40 
    41         dev = adata->dev;
    42         chip = dev_get_platdata(dev);
    43         switch (dai_id) {
    44         case I2S_SP_INSTANCE:
    45                 i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
    46                 break;
    47         case I2S_BT_INSTANCE:
    48                 i2s_clk_reg = ACP_I2STDM1_MSTRCLKGEN;
    49                 break;
    50         case I2S_HS_INSTANCE:
    51                 i2s_clk_reg = ACP_I2STDM2_MSTRCLKGEN;
    52                 break;
    53         default:
    54                 i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
    55                 break;
    56         }
    57 
    58         val  = I2S_MASTER_MODE_ENABLE;
--> 59         val |= I2S_MODE_ENABLE & BIT(1);
                      ^^^^^^^^^^^^^^^
This is zero.

#define I2S_MODE_ENABLE                 0

So this line is a no-op.  What's happening here?

    60 
    61         switch (chip->acp_rev) {
    62         case ACP63_DEV:
    63                 val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
    64                 val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
    65                 break;
    66         default:
    67                 val |= FIELD_PREP(LRCLK_DIV_FIELD, adata->lrclk_div);
    68                 val |= FIELD_PREP(BCLK_DIV_FIELD, adata->bclk_div);
    69         }
    70         writel(val, adata->acp_base + i2s_clk_reg);
    71 }

regards,
dan carpenter
