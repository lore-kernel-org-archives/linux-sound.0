Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F55C43F0BC;
	Wed, 15 Jul 2026 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784150395; cv=none; b=miZmJt77XuEBQMPnTUFYF8BdX4plUuPDG910ANjaXFGIUSa+zCZY9CinP83TqBVRb9mR3FqBLoa0ZkhaEtkJib3A+m2OP1dpZS368DjoGWRQnyUrAFoo+51XiwhoGc6sBDlxitaivhqa2QO01nTAMI6Ibl79wtX1KhQ87OItsQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784150395; c=relaxed/simple;
	bh=HF8ErXeW3JqNaFVALXMqrMLCy0svZlnruyZ2J4g+wZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4RK9GtrNktHagx0FIUQaHvfUJETi3UKUbDk9kqmL0rfGWW54nM+MjxI3rVAwtC5kjsSrUH8AWT7ZNOMo+xH5CbGInM1MRA+KsFGl0FPrqnTtk9o4IXbKGvPAYJziMDezkj1LS9wOLBjTOSKZfzPdfXuCAybVkyJOV8cs3sAbro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from MTA-09-4.privateemail.com (mta-09.privateemail.com [198.54.127.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4h0pwQ3dLLz2xgH;
	Wed, 15 Jul 2026 17:19:50 -0400 (EDT)
Received: from mail.privateemail.com (K8S-PROD-WORKER-08 [87.215.145.39])
	by mta-09.privateemail.com (Postfix) with ESMTPA id 4h0pvx3xvlz3hhTD;
	Wed, 15 Jul 2026 17:19:25 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at prepare
Date: Wed, 15 Jul 2026 23:19:19 +0200
Message-ID: <20260715211919.49462-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net> <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk> <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net> <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org> <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net> <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Jul 14, 2026 at 05:22:51PM +0100, Srinivas Kandagatla wrote:
> IBIT clocks should start clocking once we vote for it using prm.
> Do you see any errors while enabling this clock?

That answers the question from my previous mail - thank you. And I
see no errors anywhere in that path. A refused vote would also have
been visible: a DSP error or timeout fails clk_prepare_enable() and
aborts hw_params. Here hw_params completes, the stream plays, and
clk_summary shows the clock prepared and enabled at the requested
1536000 during the stream, so the DSP accepted the request and
reported success.

In case it helps the comparison on your hardware, the exact setup
here: LPASS_CLK_ID_SEN_MI2S_IBIT with LPASS_CLK_ATTRIBUTE_COUPLE_NO
at 1536000 Hz (48 kHz x 2 ch x 16 bit), voted at hw_params via the
MI2S clock control series - v3 at the time; the v3->v5 changes to
that path (clk_set_rate error check, cleanup) do not change the
enable sequence, so the result should carry over. The codec's
failing clock check runs at DAPM power-up during prepare, i.e. after
the vote, before the trigger-time graph start. The ADSP firmware
here reports QC_IMAGE_VERSION LPAIDSP.HT.1.0-01111-LANAI-1 (variant
milos.adsp.prodQ).

> This week, I will try to pull some wires out and check that on my
> hardware too.

That comparison should tell us which side to look at. If your board
does drive the bit clock from the vote alone, I am happy to dig on
the milos side; any pointer on what to check next would be welcome.

Thanks,
Jorijn
