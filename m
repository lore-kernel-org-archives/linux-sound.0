Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775303AEF2E
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100196; cv=none; b=qlG5avFRonaZNcei46hsD9Gu5VQ3ZTHlve1RByrX+WWSqTkRwA+sWgAo2vNVJZzeV8eTaIYCao0mc/CRfZwy8FOTSggvAR/V2Up1adOXQdqK3j7oycZWOTmf0GC/ZaqBCMMvqYlS4TWe/ARTYi6DAPa60jVwEnzzVy3DpWfhqSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100196; c=relaxed/simple;
	bh=UlI/Ldgr/z4TqX27Utiu2mS9vQZsNEx8JYq+LJHcV/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UilYVmEH5MhXrrmJoJEVKAbT8Na5Kji7rSszQog3gu4mC+S2im3P55VQq5tw/9RR966phnqik+YNQQzqf7FQahtZdsxRGyExa5wrlkqvmN2UP5AfU6aMNhr47LDobQyOzH/Cta5BwH7WaecYq/erZUKqSfPpux10UPYjL22ie54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=kSo4oId3; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="kSo4oId3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x0fnomzzNPNPMIMv6dXz/heBJgG5FkaT8lZlyapkhuE=;
	b=kSo4oId3xoPBLQ8rxiY8LSf+pC6BztTvQeNPPB8nrTLUZneLR2C4SEePVheiwg1LAXPFbl
	U7kQm+jh90o1XFwGSrbMr6nuN3eTp6kouFKQDz7/e6zqkBwtvRWeYbc1mzQfNAwK5vwkH5
	riJgtYFoKH705jgnHS6jQBU9xQPIlhLmeF6AgBObqSNbnqp7JejRO9ckjLsZCyBrwq5QBS
	upceUgFkwqOqdp2pjbEt50IDY36y12bZs/ghE4Jl4nnR8Z/+Ez56GFTu4Jb8To1CSPrJKG
	nWW9pswgNjzrreblDqqK20ozeCFOqN25Yz9448fjeaD1z1GRVIYv2tWTcplZ/Q==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] ASoC: qcom: fixes and improvements
Date: Wed,  6 May 2026 17:33:01 -0300
Message-ID: <20260506204142.659778-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

v2:
- add stable, fixes, and pull R-b for the first (q6afe) patch
- add channel assignments to the sm8250 TDM patch
v1: https://lore.kernel.org/all/20260423050801.210840-2-val@packett.cool/

Val Packett (6):
  ASoC: qcom: qdsp6: q6afe: fix clk vote response type mismatch
  ASoC: qcom: qdsp6: q6routing: add Senary MI2S ports
  ASoC: qcom: sm8250: add Senary MI2S RX support
  ASoC: qcom: sm8250: add TDM RX support
  ASoC: qcom: sm8250: shut down MI2S/TDM AFE port clocks
  ASoC: qcom: sm8250: apply codec_fmt to all codec DAIs

 sound/soc/qcom/qdsp6/q6afe.c     |  10 +-
 sound/soc/qcom/qdsp6/q6routing.c |  11 ++
 sound/soc/qcom/sm8250.c          | 284 +++++++++++++++++++++++++++++--
 3 files changed, 285 insertions(+), 20 deletions(-)

-- 
2.53.0

