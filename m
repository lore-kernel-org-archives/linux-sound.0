Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680388;
	b=Vq9PKJOjecJNAJE49WRaIB5GqbiiOPLda9R3nqN+iTOrt9Xi3c2AZFkHiZWwTpnEpywd
	 J34HwkRwtIrQv6r3mi3oW1IOA/nnjcSU4I7qyrSat8SZeYg6gs1kMGBSAmSrogbfUB3jt
	 LcTSmWfA8X4ehRyMBplzo63Jc2JlojEK3gNzBrdKCA0tf5C41rtkSpSgey17cdzGXOHBL
	 FAg+7mNK3yFpe3UsflN72e/a/S8h7punGe+VL1Y1bDIWGxXfv89CeGzte+0wZYqFLwqXA
	 fwxwT7jtrqONU5CFj+XQfZmXyromba9z0nTWq1GykVXtMNbNzDJlSDwWF1FQmT5eLaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680388;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=/dQX76rS1+3hofuDNWd4ZMI+FzRIsyGO9ZQX5COIo90=;
	b=oPVmu2iXYjYtGlnvWrYHKp5FQG+foPNLvWZrwcONVY7JssVpTqC8LlTf2jipExr6ZQBG
	 Bau2p/XllkAubZEbpQNUJ0w/2dGxX6XvP012fqq4rP9U4Ui48HYMEYIN3yMZDM5krAEbC
	 oYCZH5oSdOv20zoT042gj3Qlc/31YV6QheXWUZW8JM3lJvXcBZng6U2qmuDrKltto3Qb/
	 dOmvGfHfhW4wNu96jq/KOwKIPLVFw0LZdS0V73WIVXRepDb96LQygpjIX1hFaZBJFrU3A
	 w1DDGq3nUxRptAbdFpY9EEJUxbFvKeIt90ps+1r5k4xDp0PzQ/jnb5krBLJWkZpaJTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nD1EsXSy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D678606A31E;
	Thu, 26 Nov 2026 08:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nD1EsXSy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795680388;
	b=jtwVVIqZ0Rz5akJBqENA8OxNSKTWRtz6LxqSnn/W1pMJRo/zgLh/jG9WyFBrQ/z+5twA
	 bT1YVZopRmNTHGcfI0Fjernl+37W3qwltSg03vzg0EYOE4Kdx12zwph7qCwaH3diNPqLa
	 fmBSGjiG9qRSx1xyLD1BY5KWZIxFzHXWuCocoimKnRRPO+QNue1bDXjr19CuyXRYvMnxR
	 8+LcPrCACD0/VwnpAOqjgc7TtrHPmyiR6kRKu7k6nrtv5Q5o3J5dOAgHfxUM9mkAD/Jcw
	 18wQe/oumsoeMmD760fhrJ8vsYS7tB/tJKpNZ84hHs+ErvdI2hYKTP0pJgvOyQs1Kwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795680388;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/dQX76rS1+3hofuDNWd4ZMI+FzRIsyGO9ZQX5COIo90=;
	b=LRdSs4QuWSOh9rFcrld1BCakUzzi1Co6pPzrw32qFjV8OaQWa2qpCWxX9XMrVfrcvUGx
	 st2vi5eErHWzVVBue6bama7mR0lvaS5SOVeJ+XQAtZssqKJ1b0DYIV+cxfhPncGm+xIwL
	 41i+Q14J+2vGI9UsH7DEEI4c+v0MUTsjmESqKdh+GG84JOXhchupyXYHpeBSpUt6Z2qNl
	 d6ZrSUwZqH2MNPYIc/vi/hXj+W4CNv+nrxs3wZmRsX/5thIGqAvItmY18Xh84fKCBhTP6
	 2O55vkay2B82qp2ViQIDGIbpl5Jl+CpuvjIldh3PrARIwQzVToersdksKL07tTYEC0g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 414BD1F000D1;
	Thu, 26 Nov 2026 08:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795680388;
	bh=/dQX76rS1+3hofuDNWd4ZMI+FzRIsyGO9ZQX5COIo90=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=nD1EsXSyDUGkFTF6I6eMQNO63+/IAymf48VgFl+4Fwa8+wYTJA470RrQWSxL+TMgZ
	 Ml6e9YKiKAWPWd5QYwyXlBOfSHAhaBMeuYPsgK5QkAkXMSipegoBf4R7gCs2JcqW+C
	 rNExSqqFiE5zWmXE7v3WlO3vYDdcfkVscJu+ji7gRaOmE5mFhmGZoIVqhzS7Yp/gZv
	 FmSYTbiqPj1s9vTTt0y7JHRGzJtfWEayg34W8+J/nW2CNapeEO4jS3andwXzjWFFtK
	 NKUvgeffIOABF1HmjNcKCNbaqcVNzWSeG7Q90P8O3OcsUjJc1JgoZqe2FGRTv0916+
	 aOw3dHvWdWNvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9373E4D2D9;
	Thu, 26 Nov 2026 08:06:24 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] soundwire: qcom: fix WCD AHB serialization and
 wr_fifo_depth init order
Date: Thu, 26 Nov 2026 09:06:23 +0100
Message-Id: <20261126-qcom-soundwire-fixes-v2-0-07075d571c6c@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH/oB2sC/4WNQQ6CMBBFr0JmbU1bkIAr72FYYGeEMUK1A6gh3
 N2CB3D58t//fwahwCRwTGYINLGw7yPYXQKurfuGFGNksNrmxthMPZ3vlPixxxcHUld+k6gSU+M
 KdIdUpxCrj0BbEJvn6scyXm7khnVrNVqWwYfP9juZ1ftzMRmlVeHqMsNcI2J+arqa7/voQrUsy
 xdYLGbaygAAAA==
X-Change-ID: 20261124-qcom-soundwire-fixes-9d31c8dc5303
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795680384; l=1637;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=EKuMdzh0CDsAUMsVPBbo4yBwAdPy4sgV4sn7UuhWg2I=;
 b=/igoro4ofmmEDSn6eUL3l/Aq8ZauC88vivGBhSdbnqcTnYnG/rFoJbJNvZQsPCrNcMWGi/RPN
 F+kvXa2CNQ5DuAWTFW50yI7ZWUDSeLRBfGAVGMolqL4PSzjrFrBhREn
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

Fix two race conditions observed on WCD934x-hosted Qualcomm SoundWire
controllers (such as on Microsoft Surface Pro X / SC8180X):

1. Serialize each two-step WCD AHB bridge register access (RD_ADDR +
   RD_DATA or WR_DATA + WR_ADDR) with a controller mutex so concurrent
   IRQ and init/bus accesses cannot interleave on the shared bridge
   registers.
2. Read and validate SWRM_COMP_PARAMS write FIFO depth before
   registering the threaded IRQ in probe and before enabling CPU
   interrupts in qcom_swrm_init(), avoiding false write-FIFO overflow
   errors while wr_fifo_depth is still zero.

Tested on Microsoft Surface Pro X SQ2 (SC8180X, WCD934x + WSA881x).

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Changes in v2:
- Drop redundant unchecked SWRM_COMP_PARAMS read from qcom_swrm_init() in
  patch 2/2 since qcom_swrm_probe() already reads and validates
  wr_fifo_depth before requesting the IRQ.
- Point patch 2/2 Fixes: tag to a661308c34de ("soundwire: qcom: wait for
  fifo space to be available before read/write").
- Link to v1: https://patch.msgid.link/20261124-qcom-soundwire-fixes-v1-0-8ca94d60ddd6@gmail.com

---
Robert Ijtsma (2):
      soundwire: qcom: serialize WCD AHB bridge transactions
      soundwire: qcom: populate wr_fifo_depth before enabling interrupts

 drivers/soundwire/qcom.c | 51 ++++++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 19 deletions(-)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261124-qcom-soundwire-fixes-9d31c8dc5303

Best regards,
-- 
Robert Ijtsma <robertijtsma@gmail.com>


