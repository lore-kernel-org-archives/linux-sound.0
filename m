Received: from mail-m3269.qiye.163.com (mail-m3269.qiye.163.com [220.197.32.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792E37E5F6;
	Fri, 17 Jul 2026 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272372; cv=none; b=q6l3dp6HaXeZu/44PkSq+IB0phN4L+BE4wyRRfTbuoN+9Yy1CzUrMIChKflN1fiwA6VCZ16YMQOh5poap6ACHT/vNkiJHIpFU3cgyhE+h4Hh6ACEkogH+OEPsmh3zNgmIMlJChzefZigxgOyZ9q8qvQXfHxlMr105IIUcm/sGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272372; c=relaxed/simple;
	bh=YlRIym1f+hk4LE555ReYuoQhkt2lDXlgS/4RiXh4pqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ9cv+B+U6PEkBaLZoD9nq90OfKHPIggawqSlpvzAPPm7k9+u/PE35pogVdE3NzT2pMd9aOWC7kCLqvhwa1qg17hqXYpc+sW4LLZ8cUpbbCv2nUUB3WQfY7LlljcA77zx4gp/0TS0jguwdkVDh/jnuHvtoCQkOwf/eCJCB0XrDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=hyLPdBxw; arc=none smtp.client-ip=220.197.32.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="hyLPdBxw"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 468ec0c8f;
	Fri, 17 Jul 2026 15:07:26 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: neil.armstrong@linaro.org
Cc: andersson@kernel.org,
	broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	robh@kernel.org,
	srini@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	tiwai@suse.com,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: Re: [PATCH RFC v2 1/6] ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
Date: Fri, 17 Jul 2026 15:06:55 +0800
Message-ID: <20260717070655.3275253-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-1-6b7d38d4ad5e@linaro.org>
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-1-6b7d38d4ad5e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f6ee6c9a303a9kunm2ce6559b5b59e1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHk9DVhlNQ0sdGUIYTh5OGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hyLPdBxw1dyhKw9/hZpDyPUy9Ux/m0ekFFqsVKNs92U9vngkedVVIyP+YsfJnqqbLkwfUJ+UWeeLQZC8knrgl0qAYwR/7CXEdMX0ZjhtLuCoream5E5kh4ZBNNgHQ/69PrPCmJo23ZhfgnnQSc3JGKlmuFUBslhFcoSNLQtyhAw=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=YlRIym1f+hk4LE555ReYuoQhkt2lDXlgS/4RiXh4pqc=;
	h=date:mime-version:subject:message-id:from;

Hi Neil,

On Wed, Oct 08, 2025 at 08:56:48PM +0200, Neil Armstrong wrote:
> Add the missing MCLK ids for the q6prm DSP interface.
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

I have tested this patch successfully on the RubikPi3 board:

Tested-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>

Would you mind if I carry this patch unchanged as the first patch in
the next revision of the RubikPi3 audio series, drop the RFC prefix,
and preserve your authorship and the existing Reviewed-by and
Signed-off-by trailers? I would also add my Signed-off-by as the person
forwarding the patch.

Alternatively, would you prefer to resend it as a standalone non-RFC
patch?

Thanks,
Hongyang

