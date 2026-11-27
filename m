Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796646;
	b=28uGQI+uMn11gBKWhi9UzHljpPo9TCQd+QFCUIjpB3i9dP28hCEx9r/3LqeOiM84YREL
	 ZC7jlljO8RZtUroCqbxmscCxErdA8x+qscr70sfY1g5+csM2vcsDxAspXi8wJjvxaN07w
	 xiUWD7SEyKXIvR+stR8haTMDpYabMOACy6c0PIHRHkprxbGFNhrepMQGMCEKhNCuWBzrE
	 gnL8+CtUU3wuwczhuH1OlU9A2/ta3IVkrdzTqMutp50ubaQbNWVYIbZqG4vNfBhgiRMq4
	 QmChXwIAH51/hwjnbabtLCEzNP5JxPjkn9BE/8Pl2vRLD91+jnOFiAeBNbNmCdRZuBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796646;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=av8pVWNqy9lbjAOhn1Utpk20LZzg11BArgF7FGJJIBw=;
	b=dM0sRutG9cJyq4cLSOTbbIDuglJSEpSaBqbI99owkb297ldmaZ3NpuBjrH8UcAkHHlz9
	 Aj1PWoCQpCjxF+B0wW8YQs58A4QzaQmr2xyq3miflxQwg/Da9U2zx4oTFfHNEtPfcLi28
	 2Pm/nhCCxZMLlQWphxfbOKolBh0zDsovXMxViJVadrLmi5C6QLEW09wxLW82ZBYDzA0UY
	 6Je4Na9F+dVo8XG/PUFIRZT+QdO+um1sQQRhgLUrEbcVOvUqrpX7DhBFZZSAHyEjiyUAS
	 MUbBqevbj4bp3JVaNDYBlX2svMmI4eg3pPpGxo6JPrb3LaO7svMcOcG9V6GYgn4+9dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbQI+mHA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B267606A31E;
	Fri, 27 Nov 2026 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NbQI+mHA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63801F00898;
	Fri, 27 Nov 2026 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796646;
	bh=av8pVWNqy9lbjAOhn1Utpk20LZzg11BArgF7FGJJIBw=;
	h=From:To:Cc:Subject:Date;
	b=NbQI+mHAmgeLVSY63nOMeYi1nY2B8Rlj0ZmbpqkFGHSHCCgpYaOHC6LZbl+bztLkF
	 2w/237mo122h28qq5aiqdjwkmsjGgx7sm18Un8RxviXMEHiuh43TobcCvbeCLXVlcQ
	 MjeI3iNE7Iv+aDkSKcTbBaGY2mEBQlBw5CSzupFvGKPhc0vbJn6f/ZSJ0MYtpQ+jZZ
	 O36fXSfEQbPQF7gEN8diOIvSBRtuHpQxK00K9BcZuL+TSBQp/+maz8ciTkmOI+/3Bd
	 H0a3fPJjD486EV2huIBYizA0If+vzYxTbeItWJKtvmF5P+WICy3+ZAHvlNIfE9J/5y
	 nVl7ocUl3z4Mg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 0/4] soundwire: qcom: Fix teardown, clock, IRQ mask, and broadcast races
Date: Fri, 27 Nov 2026 16:23:40 +0000
Message-ID: <20261127162402.3074271-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These issues were reported by Sashiko.

This v4 series contains the remaining four Qualcomm SoundWire fixes
from v3, rebased onto soundwire/next now that patches 01-06 have been
applied and multi-master support has landed.

v3 => v4:
 - Drop patches 01-06 which have been applied to soundwire/next.
 - Rebase the remaining four Qualcomm patches onto soundwire/next with multi-master and MMIO support.

Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>

Lee Jones (4):
  soundwire: qcom: Disable runtime PM and avoid clock underflow in
    qcom_swrm_remove()
  soundwire: qcom: Check clk_prepare_enable() return value
  soundwire: qcom: Serialise ctrl->intr_mask updates
  soundwire: qcom: Prevent stale broadcast IRQ from completing
    subsequent command

 drivers/soundwire/qcom.c | 88 ++++++++++++++++++++++++++++++++++------
 1 file changed, 75 insertions(+), 13 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

