Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038275;
	b=22URnlwe6sKbasoFnY15hnT+qf+gqhwSgFiOpUp6g7hkOa+d7Hs+HVYJS3Dekt4IBxHY
	 yJktoPH+oCcEiWQJivNoH342EAojRoF2UHjaZmXQAfTGkygFRH0tZSnr49bedKEyCncE7
	 ekSTjDPuzjsrmGIcQO0cqJNXBQc8zfWDHp30/GcxMoiO7GaLupfaBvENnyFyvTCJVwQkZ
	 rYs5SAg7kklLYrUhmjFBECl6hLMR7l+ixTGGry8asUiWV7lVBOHNPURlEvTfJy6LEUkGN
	 qum8f7/kM/EePoHnbFJQPfpFUuUW6Svm4n7XIgIhow0EOhIHQV+PWmDtLqOusxBlS1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hsQZlrMZIUyRvpkJM4S3mwtOn0xcpvhVlSj+kTMn5mY=;
	b=On2V3pcWlpJviTdRynC8IRPMD2ogQ4DacHzY5jKyMMUJr4hKAndrQd4UNxvhM6wmulTO
	 dxQ2Xs+ZtGls+fUjf0Sc9KQjeTginCZ/8iW2DkF2p6RonvZmQP/KFB1Hdxu56zyPQVNnE
	 cI6vZfXhLL2PGJTWWc5bRnUPsoY/Ge7c95eiKd8s5aR3VXstHFVAa4ce70c7xBDDYGYs0
	 PwINYR5aOHjsVv4ZooTZwqtu6FnmF1kLNBiuL1Z6xLOmIuHMLN1ZJxtACwyn2Z1WglwDR
	 Opx9BEaOgEmI8iDzCKuI3JW9Um0OcqSNKCInic2r6LnOHiKylvOitp6w9ZML8RpJQiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fn8JAa7X;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F911606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 21:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F911606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fn8JAa7X
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so12769495e9.0
        for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 13:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795038273; x=1795643073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsQZlrMZIUyRvpkJM4S3mwtOn0xcpvhVlSj+kTMn5mY=;
        b=Fn8JAa7XGbmhzyQ1IqgD8bGNAqxoPiipsqrZH7hhCefKxW+4T/5jfF09kj3t5wYA/v
         I8WuSWhMqSSVEzNWSF03fns8QDErgWSvKqzPnbGUBp2M3ReN2weNoZPL2imuQ2lZChY7
         Pzsq/+I1JblQDmF1IwJM57hAYneiIyZHpxoZySl6MyNAb7b2r4fWFNPMD9dzfE50YEB+
         UnVtJS0QPcYihz3WxOqO9N2E1dWbVKVh6L2kqxAtYoaYIQgyaJTrpw855uAIVl7EGsXT
         LDvfcwMBiZvuAIouFUKH+g6140GvZQIKqxIacIeqUUPVOb942eE7aJ9pdj1YjPzpcNdq
         RWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795038273; x=1795643073;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsQZlrMZIUyRvpkJM4S3mwtOn0xcpvhVlSj+kTMn5mY=;
        b=Tqzt0IGSkKD233HTsb1ReVkbsAx8wE2409VbAM9Y1t2hln0zIK7fGyxivLDDSm1aL3
         uwQTGFfGPFsfR5vzxTdPqCldS30/uPP8TnKDQjtsjY7q7ojI2m+nH+LZl1jiNEu/cwH1
         xBDu+rsNuHNUCjG6g1AwxVnxfgoymCx2aVkFzrhimDyKJ9P1pWtlSPF/jrqwUn5lISct
         gZjVrT+hXpK4GvF5SsNR8n+wdwW+jSWMEGDNQRvV2NlxriZaHtMIk8EVrbui9DG0/gcS
         2uER9Enl+GGb92aU33loxtHAmhh3/SblHlnlYWeQx7QVmVKGhw3PrinxKD+d5zcQTPez
         db4w==
X-Forwarded-Encrypted: i=1; AL+hErHNPoDGyPQkBggFhBO/Ke4exunkQxCIj9gGxZWip4YTp9MaG8s23Wh22i9S3QSLMLnNqKTf5Dy9ht7Wkw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9XdEbRKde8uRmBzEyC4Fsv0lyRLW4sNPjFTmPZo8nQOmRUDUzR
	MybAkn6LNTN7DVDpGRcZJsce+BYRO2NaTQ0gwr6iXFod4LsDobuXJPnA
X-Gm-Gg: AYBFou345ZG4dX7k449tx3MePn6ZqtENhSgdq4TM6J+LmiBcUchxlE/1IFxqZ6T99S+
	HGUHgTaQW2wHkrOO4wgq71UDifpsfLlFzJdJC202NKi3NL1UHF/S6ezJveQ/0PwrJogKw6srHh9
	L2uJYPk5/m/HG2jaQ3lTGx5LzZWSXKzFQECjdZUiDb9F6b+zRI7C9naqpT71FbwXyr/bynArqK6
	r/816pg6h7tQ6gn8hbQUuK4Q9PRdxDeUeOrnMg3ddiuy/bpDjLDDhJERRZ5fW7RytsU4Qius/OP
	4gyRsE5GZUAE4X64XuM0Lg3My01Yr3JAKyGH9zJShPtlFNAMkHsQmvtBBE1UTkoU+yvzsJzIKFO
	L2jTTPuac+lEQSkVt6Ix33+cSr5Q6W1btbfXnN9CvfHjtcsonaNxd3rg31Y6fR5SW7BOJEPU3ES
	iu64CwYylrUVa2mF9wuLJtwUQs/wJlMZ7dyCIlxFJB+qRc086WgIhXWU44/g2KQO2XU4eJCsA1D
	tOdBpf2gA7xgzHcgyaXM5JOUZJOVk3KyzRM16A+LpZpxLDsmMNpRfBAlPfsWJd7elaJwkgONwn+
	M6zs3L9qRV106FaNRdIW/huA4xc=
X-Received: by 2002:a05:600c:6708:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4bb7da37038mr76800185e9.24.1795038273529;
        Wed, 18 Nov 2026 13:44:33 -0800 (PST)
Received: from localhost ([5.83.201.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573bccb0sm7022247f8f.55.2026.11.18.13.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:44:33 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH][next] ASoC: cs35l45: Fix spelling mistake "indductor" -> "inductor"
Date: Wed, 18 Nov 2026 21:44:31 +0000
Message-ID: <20261118214431.2752768-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err_probe message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/cs35l45.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index c087f9db6ea7..602d9828eb6b 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1653,7 +1653,7 @@ static int cs35l45_bst_bpe_set_mode(struct cs35l45_private *cs35l45, u32 *output
 		if ((release_mode != CS35L45_BST_BPE_IL_RELEASE_MODE_INSTANT) &&
 		    (release_mode != CS35L45_BST_BPE_IL_RELEASE_MODE_COUNTER))
 			return dev_err_probe(cs35l45->dev, -EINVAL,
-					     "Invalid boost BPE indductor current release mode\n");
+					     "Invalid boost BPE inductor current release mode\n");
 
 		mask |= CS35L45_BST_BPE_IL_LIM_MODE_MASK;
 		packed |= FIELD_PREP(CS35L45_BST_BPE_IL_LIM_MODE_MASK, release_mode);
-- 
2.55.0

