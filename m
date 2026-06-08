Received: from mail-m9358.xmail.ntesmail.com (mail-m9358.xmail.ntesmail.com [103.126.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4750532FA14;
	Mon,  8 Jun 2026 02:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780886580; cv=none; b=bPTkBAmtcFZAZmD/upNpBhSPEVBr0FJ2yF0PyyCuN/il8iSbcYg3WFp79uGdLHbs8NVVMrgUcuyx1hj6jHKUMQVUrzzW9BrBgpYGTHgaaKWvy2+bkOOlNDzuvLgAPH7cgGrmIzSUu9fp6xwU8UwrjWbSs5Sq+Q20hw9i1tbXEq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780886580; c=relaxed/simple;
	bh=FFHkbWqxP4gtZ0+UM4SSW3ETnpfqxrf4fmpYzQIlMcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXA+j+WIpy/4q8HtYTuqUsRw7ic71NBGSAWFYhxrHZF4dT5m8Rzmzp8JMWODoMVyRkuuE1OMKWQJgBBnPKWbhl/UZvRviT6SMWZ0LVZ3VA13mWSLHWofpdOCHpgd/gkJGJxr+Z2MuPF+DW0EY2gAmFyNxaqsaKMR4gUhVcDm3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=VcS2bmLU; arc=none smtp.client-ip=103.126.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="VcS2bmLU"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 416e8806b;
	Mon, 8 Jun 2026 10:42:46 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	mohammad.rafi.shaik@oss.qualcomm.com,
	perex@perex.cz,
	robh@kernel.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 4/5] ASoC: qcom: sc8280xp: Add per-card data
Date: Mon,  8 Jun 2026 10:42:03 +0800
Message-ID: <20260608024203.3381312-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <t2vwes2xzruqygdjasgi6akwuvephitqbyz3dntiqidbm23bki@uj22cgv72ht5>
References: <t2vwes2xzruqygdjasgi6akwuvephitqbyz3dntiqidbm23bki@uj22cgv72ht5>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea51c749a09d5kunm1fdaa3051d051f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT09IVklISR5JQx5MTh1CGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=VcS2bmLUGJ/5+Wnh1J3UcwBRUvI0f4cEFl0y2PqJdF8nSgkgFSTOxiM/bX2gRPTA3xgk6C/m54ohLqx5XJVWXKklCOqsXhTY7EMTUCDgSFzvDmM3jKFHCm8pmuyqdfFCZBAIHC9fPTc7aVZSNiVbWKRukN3MYTe5DzgnN9Ty2jY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=gomWAGuoJJ3xeyiLoDn5pG81Zg2uv+LzMpwhNWj9oH8=;
	h=date:mime-version:subject:message-id:from;

> On Sun, Jun 07, 2026 at 02:58:20AM +0800, Hongyang Zhao wrote:
> > The sc8280xp machine driver currently uses the OF match data only as a
> > driver name, which makes it difficult to describe board-specific MI2S
> > codec requirements.
> > 
> > Convert the match data to a per-card data structure and add data for
> > the QCS6490 RubikPi3. The RubikPi3 data configures the ES8316 MI2S DAI
> > format, MCLK rate, BE hardware parameters and headset jack pins.
> 
> Please don't mix refactoring and actual changes in a single patch. Split
> this commit, performing one logical change per commit.
> 

Thanks for your review.

I will split it in v2. The intended split is:
- convert the sc8280xp OF match data to a per-card data structure;
- add the generic/common helper changes needed for headset jack setup;
- add the RubikPi3-specific machine data, including MI2S codec clocking
  and headset jack configuration.

> > 
> > Add a common headset jack helper which accepts board-specific DAPM pins
> > for codecs that are not connected through the WCD TX codec DMA path.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  sound/soc/qcom/common.c   |  75 ++++++++---
> >  sound/soc/qcom/common.h   |   6 +-
> >  sound/soc/qcom/sc8280xp.c | 319 ++++++++++++++++++++++++++++++++++++++++++----
> >  3 files changed, 357 insertions(+), 43 deletions(-)
> >

--
Thanks,
Hongyang
