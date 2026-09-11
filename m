Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC829496D27
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 16:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145430; cv=none; b=UMNtYw6jlpGgFH2lA+ix70I8E6VekOaAADfkxRFwK4aazT/PYjKBN71nch2FzphuBWpATsjLzXrATHT/p7FBimpkDTU+FHBZPWmy9R1suWE069lNH5OLQ+TKqDmMIBjN9DRu+/h63CLSwN/Hs7IGB9Ca2fE+2d6efsR2G0k9HTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145430; c=relaxed/simple;
	bh=x47TK3jUwh3i8c5UgD8DnvakrZ5m0a2pfrY9ATBcHGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAPuaaX/t9qXcXDgyfRkeqWCaXDgKCHwcBK+BYt8dm6umGFatbGwuA9AOD7sNRP/M2B2iBxufIjUGWyG6QpRQh3//gpLnvgabRB1fnRNt+8lFE2wriLh6w3rrqicI/hWQ/dtYgMDLZ05Lr6Y370JjHnCkQTl/xG1U//uAnMQNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.127.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (unknown [87.215.145.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4hhL4H3ZJzzyQ9;
	Fri, 11 Sep 2026 16:44:47 +0000 (UTC)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Julian Braha <julianbraha@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
Date: Fri, 11 Sep 2026 18:44:40 +0200
Message-ID: <20260911164440.101533-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730-impartial-angelic-harrier-ab9192@quoll>
References: <20260729000649.263426-1-jorijnvdgraaf@catcrafts.net> <20260729000649.263426-2-jorijnvdgraaf@catcrafts.net> <20260730-impartial-angelic-harrier-ab9192@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: jorijnvdgraaf@catcrafts.net

On Thu, Jul 30, 2026 at 09:09:48AM +0200, Krzysztof Kozlowski wrote:
> As pointed out by RFC from Srini, this binding/node is not correct. It
> is a fake node to solve (real) power sequencing issues, but Srini's SDCA
> patchset points that this should be part of TX.
> 
> Bindings should be complete. It is fine to have them incomplete of
> missing features and extend later, but it is not fine to have them with
> incorrect and incompatible solution.
> 
> Therefore this needs to be sorted out for both patchset - this and SDCA
> version of WCD9378 codec.

I am withdrawing this series. Ravi Hothi (Cc) has RX support working on
top of it and will take it over from here.

I cannot test the RX path on my hardware, which I personally require
for all my patches.

Thanks,
Jorijn
