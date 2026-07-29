Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com [198.54.122.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF1534216C;
	Wed, 29 Jul 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345830; cv=none; b=TFGMqNENU8jGGwYHnybLDFsqYMrSr9vNkFRsnoDj9fO4kR1nTx+dDXSGdTI2uNYm6KMOlPBnve+QSwcZ1zo1T8iVmKvqRKJ/yaf4sBNZUpcxSX3bj9Dg1xJBlChbIcrxJaRfgYfzu7wIfGv8565h4nu7YIwz0Hm6E8sKSpM1cL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345830; c=relaxed/simple;
	bh=ZhLMvacTOrHBow+sxLM+A0As0oYsRxeOKlzy39KpUQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GN0TmNbnmHIYD5e726hkCjJsIH5SolUv6l6Hl1htZ5ltDcvkUC5qlCGQQjexHukpMlz9dMGhqn1UMq3tzUY/ZUyRFEEihtnRYnWol2c7xxl0NFuPI78R9hyWycwUcsnBQzL93l+3mFOLdgFXO8HiIkt9euoNNymq8vToYiV/qjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-03 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4h9K164ljCz3hhTM;
	Wed, 29 Jul 2026 13:23:22 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378 SDCA codec
Date: Wed, 29 Jul 2026 19:23:08 +0200
Message-ID: <20260729172308.43573-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a901a72-fbcf-4478-b798-e5f234c5e9d8@kernel.org>
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com> <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com> <219d44e2-28ed-4c54-bd00-66e687a0ba48@kernel.org> <d0891f90-b69b-4b27-ad58-94c342ad9a6a@oss.qualcomm.com> <3c484a68-5db8-464f-992a-6c7584841a10@kernel.org> <0cb5a2dd-c49e-47e3-8cc5-ab2ffd397a32@oss.qualcomm.com> <ba147ca6-3788-4cbe-95c3-949ae73ee8f0@kernel.org> <54f1c3e5-0b84-44a6-a03c-3cd65792de9c@oss.qualcomm.com> <6ed441b8-7148-43ef-9c9f-4bc30c468443@kernel.org> <b123882c-c51f-44b3-9004-bc1c4242af81@oss.qualcomm.com> <6a901a72-fbcf-4478-b798-e5f234c5e9d8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 7/29/26 4:04 PM, Krzysztof Kozlowski wrote:
> All this should be part of TX.

I have prototyped this with my mobile-mode wcd9378 driver for the
FP6. For the paths my driver implements (TX/capture), the following
works:

- the TX slave node owns reset-gpios, the supplies and the mic-bias
  voltages; the RX slave is referenced from the TX node by phandle;
- like the wsa883x/wsa8840 speaker amps (powerdown GPIO and supplies
  on the slave node), the TX slave driver does the supply/reset
  bring-up itself from its probe, and both slaves then enumerate
  normally;
- the ASoC component and DAIs register on the TX slave device; the
  aggregation is TX-over-RX instead of a third device over both.

Verified on the FP6 across two boots: both slaves enumerate, the card
registers, and handset-mic capture passes the same kind of 1 kHz
speaker-to-mic round-trip check used to validate [1]. However RX playback and
MBHC are not implemented in my driver in either shape, so I cannot
speak to those paths.

Since, as agreed with Srinivas, [1] already carries this binding:
whatever shape is decided here, I would like to respin [1] to match
rather than have the two threads resolve differently.

[1] https://lore.kernel.org/all/20260729000649.263426-1-jorijnvdgraaf@catcrafts.net/

Prototype: commit 7b720141754b, the top commit of
https://forgejo.catcrafts.net/Catcrafts/milos-linux/src/branch/wcd9378-parentless-proto
(milos v7.1.2 integration tree; the parentless conversion is that one
commit on top of the posted v2 driver).

Jorijn
