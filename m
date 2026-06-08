Received: from mail-m19731104.qiye.163.com (mail-m19731104.qiye.163.com [220.197.31.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D83358D6;
	Mon,  8 Jun 2026 02:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887119; cv=none; b=DAa8/6I1vTptLxhFEjfMvUaAlUYDShavaxrr01zzKuw02E/UNBZzdCsSnM4bAvBRdJ1of35cJQDaGVWuQRdAt/A+klUB9OwBPYsfis6C7a0DbEwnKti+jgdtt+3l7FG/AhXoMaVWLBMyrEgB3NtwUOgOmSPLM2d5UBWoJdylhzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887119; c=relaxed/simple;
	bh=N8vUXE64W18PddgRde03vNdC4qGDFahuP3s7CY3yLCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5gHX8BrQVacp6t/zuJcFKQOpwPLgS7XHegtI5feYVG4ENFEeozS/0BYRpATCtJHsbfXT2E12c2uLaEI3OzSk9hYSXYXwVez8RLzyc+935AQ8L5N7aoHZ6Xi0YcRR4ptsI4wSCcEVlAkTI/1aDK4wMnABXOG9A1wemhcjTcvCMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=gHnag+Kb; arc=none smtp.client-ip=220.197.31.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="gHnag+Kb"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 416dfdcb3;
	Mon, 8 Jun 2026 10:36:20 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	mohammad.rafi.shaik@oss.qualcomm.com,
	perex@perex.cz,
	robh@kernel.org,
	rosh@debian.org,
	srini@kernel.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH 2/5] ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3 sound card
Date: Mon,  8 Jun 2026 10:35:54 +0800
Message-ID: <20260608023555.3379028-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
References: <6svyrusik3lljjvoo7c27b6agr6ipivjxzeyyo6z5va2qaiatg@g4l3vcrns6hj>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ea516918d09d5kunmbe08a6ae1cf591
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTxhMVkkaTRkfSEkaGBlIGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gHnag+KbBmDxSfNbzCg4SJ5D3rHhzdTVK+WSqUD+j2WjuqCsW+VRceOpHD7vM/LsCDs/K5Yf/HC/j5hRsQ3zqsXQcQOK0tPY27taggFg/cV2fF0S7G6L0a3Ey4AeKU6s1nn8RRAmCBluiXmXlaID1iv0W5KCFD8XuSqc3qD/9p0=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=w0y2HqBqO72JeGZBjz2G9m+/S0jNLXjZrbfu9iyJgQE=;
	h=date:mime-version:subject:message-id:from;

> On Sun, Jun 07, 2026 at 02:58:18AM +0800, Hongyang Zhao wrote:
> > Add the thundercomm,qcs6490-rubikpi3-sndcard compatible for the QCS6490
> > Thundercomm RubikPi3 sound card.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > index 15f38622b98b..d95e072fab25 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > @@ -48,6 +48,7 @@ properties:
> >            - qcom,sm8250-sndcard
> >            - qcom,sm8450-sndcard
> >            - qcom,x1e80100-sndcard
> > +          - thundercomm,qcs6490-rubikpi3-sndcard
> 
> Would it be better to follow the newer pattern and define one compat for
> all Kodiak platforms? Or would it be possible to use any other QCM6490 /
> QCS6490 card as a compat fallback?
> 

Thanks for your review. I think my commit message did not explain the
reason clearly enough.

The RubikPi3 compatible is intended to select board-specific machine
driver data from the sc8280xp OF match table (added in patch 4/5 of
this series). RubikPi3 needs different configuration from the existing
QCM6490/QCS6490 sound cards, including the ES8316 MI2S codec clocking
and headset jack setup, so using an existing compatible as a fallback
would select the wrong machine data.

> >  
> >    audio-routing:
> >      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > 
> > -- 
> > 2.43.0

--
Thanks,
Hongyang
