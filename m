Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792773128;
	b=Uo9DvTq7ZgUQcjMNXeJuFdT15IWDaVplXQeBNkQ+VPu4JtMOMwXrxHUCbUctve+MNUez
	 Eeahcym9Lotzc+U2NngGVP2fl6KtKTrKMbsCe1h7Oh96f0PFhbfOrOKnjBK6/yJt2p2Rv
	 hZd9l2TcE/2ZPTs37MAK1y4DIfjelh7hJvnb3ofVTqR5YeBF45Qog25S7hGBLzRfwJl6G
	 eAMFqUZ/k7R6Wf7LqIuWxIEeE2C0uLzj2OU2y814yxHULkoftufBn6by+G+LHLwWlix8v
	 aS5nVJpwsp4PMHqvGQx9bhPq3n/UaCiC1BhqlNoBtPpND25JrxNxYitjb3OAtie+l8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792773128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BlM/Ba1fzxKYcNF8cK/r2Ab6HGfFRMtw1Lk4JcNZDX8=;
	b=RkiZAZ+pe315D4+WTPYUHU2igmvSItalXXUBCwPgXVsy16/rEmsokfYMiPOiVIPh0mXs
	 35NZdPKpaQvukuSqQT/S+FYhlTw/kpIyjQFHq2lZxxDqw6fkOg1ck+G9v11xrWvoRomJH
	 QYdVvH43KWRUZygd/CDcEXQj5npiMhUbEtWTc4tauIu/qWG4Wl4Gwp5e3LMvIroVest2o
	 GiPBMRCbiF+vmJZ48U1GZpdJgQQF/cEOyrFd/kxtyL53YrPeRxtS9zQnweQFQNZLZQfoo
	 XFT2ad+rPR4p4EBbC2sDhHlEVyBA+r9lVILoUckYJh2BVG4OrV+lgHs/q4c/HEzhnNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=N8HYWm24;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FC2606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 16:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2FC2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=N8HYWm24
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so633580f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792773126; x=1793377926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BlM/Ba1fzxKYcNF8cK/r2Ab6HGfFRMtw1Lk4JcNZDX8=;
        b=N8HYWm24bykd6jz2bbb6LHEVcgsEmTPTlEqjnl1cIBOphqVBbysAPJvVZ7bVZVtQXF
         Z+CvMtGm1/Kd2OV1dFFN1QtYlW8yC3nhtMnD5vahGXY+A7fNw8L7PrJ4cbUSOB+TNznB
         eVHbrSiwC5nYPUBoPnbzp5YjxlsbUcLmem0LZvX/QZCssKuee2aa3Kyf14Oylm+FwHGv
         n25JwnMMRveXeJ1s9mA5C4pIWq6meb0KQs5Tl6Lc7v0AipmvfotgFA35Z8BxZo8qZmDL
         taotxYNove6f6xZ8+Nkulm2PDSB2MmQeEbOLH6y+TiNb0JfoVdC7XevkhlUuQHbwwnyj
         bbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792773126; x=1793377926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BlM/Ba1fzxKYcNF8cK/r2Ab6HGfFRMtw1Lk4JcNZDX8=;
        b=gQyorrKXAG85Hbfp/Fqlw9G2vx3uAxR/rv010n8ArE9dKdWI+kqjr64RUP/FX8Ee9Q
         TPeN7sPSqDXRJX/LCvIk7jhWL/dVsXVlZxS/LaVuH17VNvf8A3K9FhymSxjraItM6XXc
         gKUeXuFswomuxtmTx7p4iibfH5fHmM5vtegqNs/1Onwx1E5pg47o+2AXHllpQG6xgObM
         7OaLWcCN8wcP2hYV6Y3h60LqFwm1P08cEBgaw8ewvdkmfHWgAH1fmkWBT+S6IFyZTvZV
         wrSG5Gjasv/y2B3PJmwXYl1EuTZbqy6Rc3JsTD7WhcqCNE/yQTyHBGsPB00e/o3Vwtj5
         nIkA==
X-Forwarded-Encrypted: i=1; AKwUvBwbOnLoMgfW5dIFbBfhU/HuvqsOBN0nrjbQw8SINmoLORESZMg65IK8iHZwuWVgxIyUvym6BLPTRsRvXg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLwPP169rgZcZzLIntQVooixAlWcCw0dGbOaykmohDyMHVaTmb
	BhPlClHvQXhQmQEK55SSo5iNcsbtoBI6+igMiKdS/dhwkqvNOGAcbqec9pHIvNJtZJA=
X-Gm-Gg: AYBFou3BoHgEo60G5bT/gztFdtyPzQE5ftLplvyVsId5Sq0BmPYMsIvIvku2sEgHIlH
	ftHW1sLt0V+1kEp1stc2RhaPBblFrd4cfEooZ8YJJ5wd4vM/3U2Arvg5A1KgmApVCsxUsDQTeqF
	9zsJmixwUpFpfawz0Qy5LoUG1lzeOt838gGtHoArZRNbK0Mo+m6uocLZ04nzXoZiY2FI5P1PF4Y
	/bQyCxw85yUGzHTp70V0Eswgn5smp8tCFTTDkIM0QyUx8Hvzc37vu9HncUa0pb4M5LYnxbQ99aO
	HIUUddYQRE6lrKqznPscrTl/rsBrpmpuM0N6vuS461dKiSoaH1udvCdo7eH22OzGLx3Nd9V38rA
	d/xpVUCKZp5tpQXUVpZiNWGODqnFzabNKosWzVTRCV8AXDJvwMDUS8GABFY4ZUZNNC7NSnvIlHb
	55Fzhn2Vv5xzojNlMLQcTDaQOf7hgynIHYX+Ohnpn2vdXzU4vHThVEgWES24+GTuizYVN7+UnWs
	HkLdsywV3bUzPrth2dD0AeZ+Z35kHDbq0U1OCQ9wiw6wujsHzdoBVUJcNZ+QhFTTsoJetjXg82i
	3Oi7kllovTmT
X-Received: by 2002:a05:600c:5246:b0:4a1:985b:83a9 with SMTP id 5b1f17b1804b1-4a211c789eamr53091865e9.4.1792773126321;
        Fri, 23 Oct 2026 09:32:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d40459dsm838720f8f.28.2026.10.23.09.32.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 09:32:05 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: Re: [PATCH RFC] ASoC: cs43130: Take the frame layout from set_tdm_slot
Date: Fri, 23 Oct 2026 18:32:04 +0200
Message-ID: <20261023163204.81746-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <atsvgeFtiSW709k9@opensource.cirrus.com>
References: <20261023081457.44579-1-olivier@mgcrea.io> <atsvgeFtiSW709k9@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Charles,

On Fri, Oct 23, 2026 at 10:57:21AM +0100, Charles Keepax wrote:
> From a quick poke around the generic machine driver stuff it
> looks like it keys all the set_sysclk stuff off mclk-fs, is that
> needed on the host side or could you just skip setting that and
> avoid needing to do the tdm workaround?

It is needed on the host side, I tried it on the R1 without mclk-fs:

- simple-audio-card then never sets the I2S clock, so it keeps whatever
  the previous kernel left (22.5792 MHz on one boot, 12.288 MHz on the
  next). At 12.288 MHz the X1600 I2S driver refuses 44.1 kHz and only
  48 kHz plays.

- with the tdm slots dropped as well, hw_params fails with "SCLK freq is
  not set": the codec only derives SCLK itself when it is clock master,
  and here the X1600 is.

> If we are adding the set TDM callback we might as well add full
> support looks like it should be pretty simple for cs43130. The
> positions are set pretty intuitively in cs43130_set_sp_fmt(),
> so just need to save the slot numbers and swap them in for the
> params_channels() stuff. But at the very least if we are adding
> partial support we should check the masks == 0x3 here as well.

Makes sense, v2 follows with full TDM support (the slot numbers saved and
used in cs43130_set_sp_fmt()), within the 16 to 64 bit frames the clock
tables cover. I can only test two slots on this board though.

Thanks,
Olivier
