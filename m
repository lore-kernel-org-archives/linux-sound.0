Received: from mail-m9351.xmail.ntesmail.com (mail-m9351.xmail.ntesmail.com [103.126.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB740DFAF;
	Sun, 15 Mar 2026 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.126.93.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773555823; cv=none; b=OqwM135w4ANWMJMhvvFKSBRyIi7UL9eLATnynbKt84LfSDKbQ3lEQSdS/1FYtlfCGbh2B/3/ZZnS8dHFhF0z5lhzIbfajQLkrEKxJwf/4KxnqXzZL7hQ2b5ANLwYl2ptE48O/X9U4piwVoBMaiCiGNQyJSvyitSsPFejT5Z6WJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773555823; c=relaxed/simple;
	bh=lv1BZ1fF3KRzKq0KmMZAne3HwKae6+zEI9pXH9CtPOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azQZQ55i8JXAZQYuOnrl3brqO2lNMJ1J7Z8CiPJH0B2WjdclwrJkMMrcA8odp2Q/X6WRKQ3fAnrL5lSHTP/dfPygaLSWmECTnMDZ1nt7ajNOKl4gVoSzaKnlJQJY3lzpezSb3PPBM5tNlyQH1V5yyUH4JIM7jik/oTq+ifiWhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=E2NQiTaP; arc=none smtp.client-ip=103.126.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="E2NQiTaP"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36f9a2afd;
	Sun, 15 Mar 2026 13:07:50 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: broonie@debian.org
Cc: andersson@kernel.org,
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
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 2/6] ASoC: es8316: Get sysclk rate from MCLK clock when not explicitly set
Date: Sun, 15 Mar 2026 13:07:36 +0800
Message-ID: <20260315050736.472233-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <11e84371-57b2-4ea3-b3a4-0119d182229a@sirena.org.uk>
References: <11e84371-57b2-4ea3-b3a4-0119d182229a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cefe4ba8a09d5kunme5db3a35239c66
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQh0YVk1MSUxJGEgdT0ofHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=E2NQiTaPn/WMhVQH9kXX1NTuYXb56GF9AhDU+eaARGuuZGLuAzZPcysDDvVcnVdIuGxWvzn0M7Sbn31Naypr3xvkzeml6/qaJxCn0N0kxDH8fl72v5ykEXp1kbVtVR4creNnuEc25fgCXRyJmGQ/ovr6pPhmZOBPMS1OskPtkQ4=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=O2eqvpKafGnKxNWw9MkHGrYpLnJFGyGVG3+11y2x6Jg=;
	h=date:mime-version:subject:message-id:from;

Thanks for the review!

> On Thu, Mar 05, 2026 at 01:47:43PM +0800, Hongyang Zhao wrote:
> 
> > @@ -477,9 +477,20 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
> >  	u8 bclk_divider;
> >  	u16 lrck_divider;
> >  	int i;
> > -	unsigned int clk = es8316->sysclk / 2;
> > +	unsigned int clk;
> >  	bool clk_valid = false;
> >  
> > +	if (es8316->sysclk == 0 && es8316->mclk) {
> > +		/* If the sysclk has not been set, try to get it from the MCLK */
> > +		es8316->sysclk = clk_get_rate(es8316->mclk);
> > +		if (es8316->sysclk == 0) {
> > +			dev_err(component->dev, "unable to get mclk rate\n");
> > +			return -EINVAL;
> > +		}
> 
> It would be better to do this by bootstrapping es8316->sysclk when we
> get the clock, we do a clk_set_rate() when we set the sysclk so the two
> should be in sync for robust operation.

I'll move the clk_get_rate() call to es8316_probe(), right after
clk_prepare_enable() succeeds, and drop the fallback logic from hw_params().
Will send a v2.

@@ -774,6 +774,9 @@ static int es8316_probe(struct snd_soc_component *component)
                return ret;
        }

+       if (es8316->mclk)
+               es8316->sysclk = clk_get_rate(es8316->mclk);
+
        /* Reset codec and enable current state machine */
        snd_soc_component_write(component, ES8316_RESET, 0x3f);
        usleep_range(5000, 5500);

Thanks,
Hongyang
