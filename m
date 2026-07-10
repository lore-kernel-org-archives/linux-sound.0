Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CFD42E8CF;
	Fri, 10 Jul 2026 14:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693986; cv=none; b=ujf1ua8tP5vcaj9PhF8/8go3dH8dMKJ6VxrFe7gmDK0hK2MatRLBgUo3hUAv4eyYijG9U8C/oE4VwzZkh0HdTp0yF4VzNTpoMP/ZvRTc8n0Ir1XzPxyBZmv8/C2nd3hC+JOv/VmHi26YYY6nZTuJ56ev21hs1oRXq9SH3tfrcxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693986; c=relaxed/simple;
	bh=WVb16efMgHrnE5h6bGD8P2AVkU0kB2BT97DTXz4nJLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOVHVHDD6ewg0VVC4rco/TH/lyi+LMK5tvTeDUZO0zCjJ2zz/rrAC4vtJvOTViVxg13aF6SDeiXznAVqVTU2sJn/80GExTIVd9NUW5AdD4GTAvLHnZo5nA762MlD0FHAfUZ4AbItP7BVPxt9i7WuTGmygiAoNavVkxveCQzHTyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from MTA-06-4.privateemail.com (mta-06.privateemail.com [198.54.118.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4gxZ7C6jM1z2xgr;
	Fri, 10 Jul 2026 10:32:55 -0400 (EDT)
Received: from mail.privateemail.com (K8S-PROD-WORKER-08 [87.215.145.39])
	by mta-06.privateemail.com (Postfix) with ESMTPA id 4gxZ6l5d1dz3hhTJ;
	Fri, 10 Jul 2026 10:32:31 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Srinivas Kandagatla <srini@kernel.org>,
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
Date: Fri, 10 Jul 2026 16:32:14 +0200
Message-ID: <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net> <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk> <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net> <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Jul 08, 2026 at 11:13:18PM +0100, Srinivas Kandagatla wrote:
> I guess you are referring to the IBIT clk that dsp provides, not the mclk.
>
> Could you not enable this from the machine driver?

Yes - SEN_MI2S_IBIT, provided by the DSP, not the mclk. And enabling
it from the machine driver is what I tested with the series you
point at below:

On Wed, Jul 08, 2026 at 11:18:50PM +0100, Srinivas Kandagatla wrote:
> > So for v2 I would keep the two behaviours apart per interface type:
> This is not going to scale, please try to enable the required clocks
> from machine driver. Pl take a look at this series
>
> https://lore.kernel.org/linux-sound/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

I tested that series (v3) before sending my previous mail -
the report was buried in a long mail though, so here is the setup
and result again in a bit more detail. I carried the series onto
the tree my board runs, described SEN_MI2S_IBIT as the "bclk" of a
dai@147 subnode per the new binding, and set mi2s_bclk_enable in
the board data, so the machine driver votes the clock at hw_params.
The vote itself succeeds - the DSP acks it and clk_summary shows
the clock prepared and enabled at 1536000 during the stream - but
the amplifiers' synchronous power-up check at prepare still reports
"no clocks", and with the graph started at prepare the same codec
powers up with no bit-clock vote at all. So on this board the bit
clock only reaches the codec once the graph is started; the PRM
vote alone does not drive it.

The question that decides where the fix belongs: is the DSP expected
to drive IBIT on the pads from the PRM clock request alone, with the
endpoint's graph not (yet) started?

- If yes, milos firmware behaves differently here and I am happy to
  debug - any pointer on what to check would help.
- If no, the machine-driver clock route cannot cover a codec that
  needs the bit clock during the DAPM power-up sequence, on any
  AudioReach platform, and some form of start-before-power-up is
  still needed for such links.

Mohammad, if you have a chance, could you check on one of your
boards whether the bclk vote alone - before the trigger - produces
a running bit clock on the pads? That would tell us whether what I
am seeing is milos-specific.

I do take the scaling point on the per-ops split. If the vote turns
out not to work for this, would an opt-in per link fit better - e.g.
the machine driver (or board match data, in the style of the clock
series' mi2s_bclk_enable) marking the links whose codec needs a
running bit clock at power-up, and only those starting the graph at
prepare? Policy stays with the board, and DP/HDMI and everything
else keep the trigger-time start.

On Wed, Jul 08, 2026 at 11:13:18PM +0100, Srinivas Kandagatla wrote:
> This is going to break pipewire DP audio case, because pipewire will
> call prepare during the startup and if we do not have DP plugged in dsp
> will fail to start the graph and whole pipewire Audio defaults to dummy.

That spells out the severity - every variant proposed above leaves
DP trigger-started for exactly that reason.

Thanks,
Jorijn
