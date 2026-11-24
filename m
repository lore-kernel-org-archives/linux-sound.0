Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560420;
	b=XlZUkbY19J/jxKTa4CX5jARv1CbpU8FrV+/UvrrZOUHdE6b6aS8LlUDEPCsLrh3ohyWg
	 e5wjELJny8cKiU5gA5gXtYB4Wz9kAWlGP/So+UrpmTdHHzp56RKBIGaHc3U2K9IpAKz10
	 WGzzMCa037pAVgnlVx5j/rKL1h+nrQvpXETkbNc+HrXGwSCwRBN1RP/qNpwWdfJjfDyqt
	 L2ckMFCZRaQVszcfcpPK9ukbFU8EbcU4Jv6H6i+cwP81EbCE/FCZw7etlKfBXThEcU2Hu
	 6GFB/s/RN7cnEVqYmQ2UnrfEyND/MUX5iD2qsLhFsy9+4N5nb9uBt98go5rF1I3ccvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560420;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=6QBH+QyIPuZ5eESry9czXmbEjy+pBjEUYZUBFcAeLBs=;
	b=20qSmPweMb3CRGOyrrIqZJUT14D12eJnTmgM/YTbBFSHc2BpJCn1w8ScYUHEszaFBi5z
	 T1jRfaCbXzbSlzwehv8wzYHgKCXuyqw3wSWw3bUXhLVHCcu0XVYmfz92oBsPu5DAzWCk6
	 Ez6EIMge4i/5qbFxEoDYCzmWdnKxDmOwSQ0hE8gy0d0vZvJTGnUgXhgG7FdSQKhhynS79
	 2scH9t3YblarRpEbekRs4RdMRLtJ1+cp/4MqKpW96jJIOcQzKqQGrWDWd4tjI678cNCKB
	 ea+7vDCG+rq9N6m8H3sGRqgsDUOtgm6gpGq9pHkqL46nMHrxJpPMMtjV8/DcaxenTIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1QuoGpB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEDF606A321;
	Tue, 24 Nov 2026 22:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j1QuoGpB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795560419;
	b=zSHbf6NU3aq6GVMCuacm/ybpO6O++QtUhEHytBbj9sS66i4YxWSByWtLqZe6mEyXpVcC
	 6pR7f8MMkmThhaMcFDyDfcR3fGPsYr2f5hxOS665AhmzSjnYdrkvAIovChZVhuSFCUqSB
	 aNIth3CNIJNlGaBNyTHzb7yiS7P6nBxbtkVJy0mUs2nxQLwU1lniUSJ3Pk24uJLDaDmYk
	 A67uQnIaK08ywNi9ErZzypJM1jyWT4lzRI4mzsVXzYQ0NpphjiI7XGTQvTlA4oM0CNRX1
	 3HJHF5YXl94DKJbjkUKw3J4vzquD+y6ERQF5b6PZTCobf0snnK4UFMSkzgSeXlrGuvg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795560419;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6QBH+QyIPuZ5eESry9czXmbEjy+pBjEUYZUBFcAeLBs=;
	b=vIK6z47ev+PAoXYtQV2FlLGttZYvwGKf9TaWLvMhOic9RWW/0eUFeO2hslwBfyZp+miR
	 do7yGPkMSq3TTU5x0uR+nsCZj1MiFQ7ehLtMzt/XD04hDWUl0p6rUDFM3JTNPoMsu9/3A
	 0aZge6zwdc1iXMUPcv1Pgg/S6VBX5lhshaCjuLP7QB07pQ9aW2ZxxwlNK+LKAAyDxtKra
	 M+AHTUDvn7At9vnuAp8+6rvl0xShzFtEaC3d0lH8yeBHGPY9YEewzSWFHEhIbRheYURAA
	 as2+WtM0icgxGEKztTFfBtEX6+Hw/lCjXiepcfVJy/DCdjpRjOMp1HgL21LN1R5zu0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEAFE1F000C4;
	Tue, 24 Nov 2026 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795560419;
	bh=6QBH+QyIPuZ5eESry9czXmbEjy+pBjEUYZUBFcAeLBs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=j1QuoGpBrqwsrjvoJ+YmrzhFLIUmcvFFFfbAOaRKkJo6FGGjE42PYoNSWr8licwpE
	 fINy6/GVkU5PNMm2evhDnfQD/FgM5dMiASVcFrCoiCyRg+lDIHa49z2X9w6yuIqK8J
	 0NlQzJdAqaRL9sVGeZ2FZcuMeKfP43tKMoSeamhp/wNnOy76Qjo9Xk5lnxJ8EOcGBs
	 7nTF564yVlO9Y/2cL0O75vfHzOz+hJx8KxXBUgSlppeJK3sTdqOJLI16yV3gVC8G/5
	 sPAvSI4JLN0dKTJ6zh28u3f0PRWqlC86f7vmpt+NdgpWBamK8mVt/7f6dksQgSz1vq
	 n79Krk39KanhQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 339514CBE9;
	Tue, 24 Nov 2026 22:46:47 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH 0/2] soundwire: qcom: fix WCD AHB serialization and
 wr_fifo_depth init order
Date: Tue, 24 Nov 2026 23:46:45 +0100
Message-Id: <20261124-qcom-soundwire-fixes-v1-0-8ca94d60ddd6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBCF4auQWTsJbZWAVzEsdDrKkNBKh6oJ4
 e5WXH55+d8KyklY4VytkPglKjEUmEMFNFzDg1F8MdjaNsbYI84UJ9SYg39LYrzLhxU77wy1nk6
 udlDSZ+J9KOWl/1vzbWRafl+wbV/o6jpEeAAAAA==
X-Change-ID: 20261124-qcom-soundwire-fixes-9d31c8dc5303
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795560406; l=1208;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=nRQ81G0pOHjTe19q0T04n8A6t3fPhnAHDBRobILJgfU=;
 b=Cgl9VQw+aZpzc2uVyo9Pn37RN8cCRaw9l4qgsxkUnFWGZrCsVHjqaYH4a9fuPeSGLUKMQZJJC
 tTwJmyKlJS8BNPqmwSb7fn5+dhMqDk89ZIg5YCKNqW4S/qb9mAaW5wK
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
Robert Ijtsma (2):
      soundwire: qcom: serialize WCD AHB bridge transactions
      soundwire: qcom: populate wr_fifo_depth before enabling interrupts

 drivers/soundwire/qcom.c | 57 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 19 deletions(-)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261124-qcom-soundwire-fixes-9d31c8dc5303

Best regards,
--  
Robert Ijtsma <robertijtsma@gmail.com>


