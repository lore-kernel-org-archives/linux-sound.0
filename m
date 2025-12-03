Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73E2BEC2C;
	Wed,  3 Dec 2025 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764759446; cv=none; b=A5MFDmDaXvKZsKtiaNpkCeYMINI2Aa6uYmfNsDal0a+AvvubccZuWab3HpJO0OAgeP5el6io3Vrv8Kpm/4NEa5eLejvba42ROVLaRk2rQ2wKt6vZf1lVAWR003Fa8PiYnZC9YKezqgBU0lN9aXHr4jtC1ICVta++EOi2J1dq140=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764759446; c=relaxed/simple;
	bh=vkCyyERIklh4U4z6xCbMZ3gs906bLqnGtNQBa9Zvwbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GaVDL1CgQ4NZIsORNoNT9NDxZAcrRI3Ai3vSrstJ7bHLBJdnl4MptxPDJ71OTNXe0q7alFFtoKkoz/Vmioz8D04GHHvpUZzI8jM5yWEmLB2+YEEYE8nP1lbKjiPSTdtHOX2PE5409ZnCT+YUK+4V3kwx+k31VWlbOyoz5rhOsks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHtn2qpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHtn2qpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D492FC116B1;
	Wed,  3 Dec 2025 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764759445;
	bh=vkCyyERIklh4U4z6xCbMZ3gs906bLqnGtNQBa9Zvwbg=;
	h=From:To:Cc:Subject:Date:From;
	b=nHtn2qpg8+h/hhwx8Dqk/GuwR7rii78SsERBm2fkIg4znTQp1bCtJ2FqN3QwM5K0Y
	 iqS6e73m1EcwhSaOzkwyz+dpOq+7QK8e15rgU0tfcPnslmHZzh2Wto29H/qG3mxL7M
	 Pdh5KMDz9N8GukdyO7cKDCYrxn26PaTrm7AYNoHtP7+Hhzri6NARQU7th1J4koKrfF
	 lq31Fze5ahnHLnyjFV5xJENinaog+xNuHWmTqjL6q8OCi3gLeqBMQoeID78TKaMCK+
	 H9y/kDratYsSMtH36rUfJ/Tevd8ORxQ5TwhJpkyNjXoiIIZ62PkTeAE+c9E51JrBvj
	 PkzXnRak2z3/w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vQkY9-000000006UU-2SCZ;
	Wed, 03 Dec 2025 11:57:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] ASoc: qcom: q6afe: fix bad guard conversion
Date: Wed,  3 Dec 2025 11:55:40 +0100
Message-ID: <20251203105542.24765-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a bad guard conversion in one of the Qualcomm drivers.

Included is also a related cleanup.

Johan


Johan Hovold (2):
  ASoc: qcom: q6afe: fix bad guard conversion
  ASoc: qcom: q6afe: use guards consistently

 sound/soc/qcom/qdsp6/q6afe.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

-- 
2.51.2

