Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426693;
	b=tf/PxaL9fBXVIMsovPBxOgznUI8CsKhk75ziuWTOlXNd8BrGMc+fYNhaQHl1JXehuoZg
	 VWoBC/Jjbd/57Fpp3Ko48jExOvg3HRDCQWbANnrwH0mhYXNxpQLQASD22hVS5jNEdhubY
	 kcgZgKNNv68NuRcWo+D8Rre7pF3EqiFAgEQJNZyPsNXJUCukD+xSjfzEtCSVhsPSSgO+W
	 ITsK4uN7JwTh7IJUwWudAGJ6J0LWaykeTXJeXpkkSctCjqMq6DGs5viRLhIhb4MLRLhC0
	 nsd2Se+PQ9S7rIDrWqVGU7k78wtnHIKPJtBCY7O0tPc+aTltu4WjuW6nsf3SrQpNvlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
	b=zOuwRvgLg6P15Qqveo6e1qz2cbULXMvEuK1t6te0atQUlwlEJfjKuWitwKMuaJRzYrG1
	 aWkxOX0wr4pV5Okxgcq/QrlUazIdZvmqUosHTetkVAFaiW5syq7K2KfrkMjuWiqU9lhlK
	 T94aHzSzfstEBXa4MphCcZtowvRHtYdMNKMxlwyORjyctxYldVc05oNg1U+2f78HnGlh+
	 25jL92ceB5oumjxl6fDniFekehroJTvnl5FAr986vjbtPFoA3JtywSsjaLXdyEhYvK7Mk
	 X7FaomNiTHvARe/jaC//hLI48GSgEjYya6jkPvtoo2k8F74eIMbKntvoYLmmEWR0OfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NlghLLUF;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2660A3825
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EA2660A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NlghLLUF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35c76e9614aso4427035eec.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426692; x=1793031492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
        b=NlghLLUF2FbNboWwLud4VJ9BQloVK1P5Z2CdqbcQVhDho2r5kJ6nuKmYD2aZL9lSgs
         XUyzYjjjAJWcpCFbC2L7wWmGJ1bFk7fZtKpmansYVFVyVdjhcuxFTq6Crym1jiqGsQ9J
         FQBjTcuqfrizyKhzORa8P4iWbh9/Y7y/7IVE5ay/ZGzQri8bQfODzav9KGpIwmSlWGLR
         RyuVHwcQKGhVzV5SQ61QFz7pE8CfLm2JeaT8beVGh6vi6F2qSlanO2cXcbAOFYavlFT4
         bz32NgQe6uyP+9PGDwiSYq0APKnYZsxSvyKkH0fE8hwEJg7LgbQD8CANBFqDMHZFpSgd
         Mm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426692; x=1793031492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdJPCWnGkorpLO32ktzbPWjsu9IZRJbbXQIGeOMqDBs=;
        b=xBykTHw+2g1VF+42sHQXglt1XId720zcBWK9U5Bbbn24V7h6q+2iPpGPEprxeRINXo
         Cey8K0A+PzKrWqAsapDyzea3DcPoD6wEKvv6qWC+kDgNZ5xDZVkndY5VRoXEZmfAe8k8
         pSniZtAKKeuZxARR2q29nEMPOghTLo7T4K2k9U2j14gkFLxlzI0soCCS/+HtXXiWvirP
         vQtTe96lMyVy2mAqMgCRWjYfr7/f5v6kuLboGVypoJ3eNZYa3vCdgMjwFmIc8JbDViQX
         7OaCRUSCkpGv+UHI4dt8+v/og1RSkLotpk1e1lSnnXVlKUJdBu9JXTMepZ+zd5zH5opB
         2pRg==
X-Forwarded-Encrypted: i=1; AKwUvBw1PAdBW6O1UmFeX+Q++mQvqAXhbFH2Q6ketw1rV4BY5i0944L6NNlWlePWqH3uo51HWQG5Xhwdd1olZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI7lFgdp8ccO59+AXOIMW4zk+EM9w0K/bSLWlPtZaxmccUqfAq4
	Z/0A2aq6uXon15UT6YmJnJfz+EE7WroWqHifSCqc2wJH+x6QHvLYSVMW
X-Gm-Gg: AYBFou1pOheuoGHj8hywYJfUZ+Xb1MnkhIP5OlFa+1uXEY3cmN/c7x/F3zFbaWNq2IP
	cZwXauvndNo6849ccjOMjTFmYhEBYybdk+cIdpYg3QjSvsAZdJpQHZQfNWE4jHrfjXgFrog7+zP
	nBEgbZ/8ApceRaT830b+7hvKHEWD9Y0xOK8QZBLn6R/BytVAakQtNnD6sRzxgtXqMDE4S9MH+fv
	HLVDgj7nRYgqVJMfX0KhNsvZTywlr3WKekdwPD8NazSmdnxvHoeRTDS5ILTrL1VSkN9cz+/NIIk
	9+6FY94JFcuFqWAxyTP7QvP+gENdzkFnA3BLT8H26f+trFjKuYbTPzHARUOFulrY0R5BWpYE0PG
	PHaxKudmLqg5ljtW0A26/HNklnezKnTc7MyCEqifQkIittJ1RsnsPnTECaRBNWe4YH/GPh/blgm
	Jh8jHlmk6OAmxe6UAdFT9RkBVkUYk7uuZbwLU93LEFT3D41qVZpsBWh7YyD5ViNo4uPD6X0qewY
	iN+LgDNU8coLY4a2V0erA==
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr10294813eec.11.1792426692027;
        Mon, 19 Oct 2026 09:18:12 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082b8573dsm33412914eec.25.2026.10.19.09.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:18:11 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: q6apm: Fix the wait for SHARED_MEM_UNMAP_REGIONS
Date: Mon, 19 Oct 2026 16:18:05 +0000
Message-ID: <20261019161805.2427-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The DSP acknowledges APM_CMD_SHARED_MEM_UNMAP_REGIONS with a
GPR_BASIC_RSP_RESULT packet. apm_callback() stores the packet opcode,
GPR_BASIC_RSP_RESULT, as the result opcode, but
audioreach_send_cmd_sync() waits for the result opcode to match the
command, APM_CMD_SHARED_MEM_UNMAP_REGIONS. The wait never completes,
so every unmap blocks for the full 5 s timeout and logs
"CMD timeout".

Store the opcode of the command being acknowledged, as the other
GPR_BASIC_RSP_RESULT cases already do.

Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
Assisted-by: LLM
Signed-off-by: redducc <sushmit718@gmail.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b6b1ef6833b3..379b15b7e503 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -960,7 +960,7 @@ static int apm_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 			wake_up(&apm->wait);
 			break;
 		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
-			apm->result.opcode = hdr->opcode;
+			apm->result.opcode = result->opcode;
 			apm->result.status = 0;
 			rsp = data->payload;
 

base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
prerequisite-patch-id: 22bca48e48813fb55976db043f9c35c926c61e3d
prerequisite-patch-id: cd21b1ff6a4fef14c706cea97fc906d7a0331b5c
prerequisite-patch-id: ce4057205dd2c2a6650c3a36c60664bd2737e202
-- 
2.43.0

