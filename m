Received: from mail-m49239.qiye.163.com (mail-m49239.qiye.163.com [45.254.49.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF7361DCB;
	Thu, 13 Aug 2026 17:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642360; cv=none; b=eijb98qTfvNxHVwUsR0d8p5LERGVrIl3e1pjkVV0vImE7EskyST4Fmn7PpS4HZ7dU+uxq14hLVcJtLE4kZgnV+GTfvf9BNqnLWx/sMNSEsrNSTRs/9ylFhpWCCVtoQjiaNyMHNYAEJAg6bPtMi+9K2s42GyUBDVYhfk7YTWem8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642360; c=relaxed/simple;
	bh=TQtuR7zDPNuLfDszfK3qAQ5ZZ0KoWdvzlHGzZWc+avw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lh9hWHOlf/2uTTr8TKihXRvmt4ojt8jGPkWsDOGWX8kRPhmuvfyHiocRr/HU0jqN82BGKxDDBwVJiHjwLY4iCRm+wofm8YWDEXlS50uErNmlaSiIpwbcOHq2/zdo1A3ama23TN5P3CbqlcJdy9RCozA7Bg4FYB936f2mD4OkYiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=ZDT4vwKJ; arc=none smtp.client-ip=45.254.49.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="ZDT4vwKJ"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49e689176;
	Fri, 14 Aug 2026 00:56:58 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: robh@kernel.org
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	drake@endlessm.com,
	hongyang.zhao@thundersoft.com,
	katsuhiro@katsuster.net,
	konrad.dybcio@oss.qualcomm.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	matteomartelli3@gmail.com,
	perex@perex.cz,
	rosh@debian.org,
	tiwai@suse.com,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: es8316: Add regulator supplies
Date: Fri, 14 Aug 2026 00:56:30 +0800
Message-ID: <20260813165631.843134-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812194234.GA693895-robh@kernel.org>
References: <20260812194234.GA693895-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ffc0e38e809d5kunmbcf4942f49ab21
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGRlKVkhDHkxCHU9KSE5IT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=ZDT4vwKJ9rYhhS/knhbiTAwpgFpdcDaGaTVjcccvq21mhDQW3akGMq25MVjcAP2SMitrq8HAPcEFA4kAUBQdEGL1ZXmUG38ozles4EA4qBNvhaBkc63EntYvkzarmrPwN+r7F2H853fIIzUA4Q8PN9c+vLuIyo419/IPorukH7M=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=oGrqBopJhQGZLMhilA82ZgG1r6whlArGp3u4zYFDF88=;
	h=date:mime-version:subject:message-id:from;

On Wed, Aug 12, 2026 at 05:35:43PM +0800, Hongyang Zhao wrote:
> > The ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs for
> > its analog, charge pump, digital core and digital I/O domains. Describe
> > all four inputs so boards can model the codec power topology.
> > 
> > The binding also covers ES8311 and ES8323, whose supply inputs differ,
> > so restrict these properties to the ES8316 compatible. Keep them
> > optional for compatibility with existing descriptions.
> > 
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  .../devicetree/bindings/sound/everest,es8316.yaml  | 27 ++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> > index fe5d938ca310..276c73bb4790 100644
> > --- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> > +++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> > @@ -30,6 +30,17 @@ description: |
> >  
> >  allOf:
> >    - $ref: dai-common.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: everest,es8316
> > +    else:
> 
> Missing 'then'. You need to invert the 'if'.
> 
> Looks like Mark already applied, so you'll need to send incremental
> patch.

Thanks for pointing this out. I understand the issue now.

I inverted the condition, moved the supply restrictions under `then`,
and sent an incremental fix against the applied commit:

https://lore.kernel.org/r/20260813-b4-es8316-binding-conditional-fix-v1-1-6cd56aa1370c@thundersoft.com

I also verified the fix with dt_binding_check using the latest
dtschema.

Thanks,
Hongyang
