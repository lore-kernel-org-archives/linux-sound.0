Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A93D46AF3E;
	Tue, 14 Jul 2026 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036575; cv=none; b=OlgQWuEwBOWWH/g1eW7dWb9aFMQ1TBCW9hqSWFYWSPWrg7tUjnViyE92WfvCCIZQrj9VIpFwOoS6nImqlalzo0yGtlgqSdsrgDm7cpIX0xAsIAaHgE+s9aDUIxfQw4hxrnf/Ytl34OUm/m5TAwX78j9NTdImNEX5wNsMgL4JkXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036575; c=relaxed/simple;
	bh=5gYQvavnqI9lm4kbdjEV/XUV6dE0grJr4KszdhdK/8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oa7bj2BjVjf8ufqhPTDMkcuWspjoSIO0YWczlgSNcKxmvncuqypuoDLqe2n+jdBFoJWjv+RyzK+v4w8A0lfa7K8puBwZHaBIccw+pc7PORyUM9QrnBWgUavUhfAo/i+tFhtXjHknf7No8nwS4LnynLrjYgtLPmej5wOGn2WZPnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXeWIdnH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXeWIdnH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC0F1F00A3A;
	Tue, 14 Jul 2026 13:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784036573;
	bh=Y5xzVKg0zgUg0fxi1tjrjuzU1m2bzfMsm34VuVLPUrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=AXeWIdnHPUZwbNyE2+RUHQ815LLywi/PGe8YgMHLvm4NTSClIhgiWJpfdRYYRmh50
	 Cd6xGeMFiRXGvL7nF2STd68BNLOB+Nto57XpKTi6J8zaXpiZjOv0Hcd49OrCUY672I
	 eOqhZ+Vcs6hWVZBP9ryZB2J4ioTRFNNEaHvV+DgF/x5OM874oCY1FzhT8KLL+VxmPe
	 /GLk7xDbSQQKXrn725wkYgF5/vAm/0/od2iKXLHDTVKG4Fcmal6Chwd/NaaH5OzQjE
	 gSSAteczU9dD/fWDnaU5/vE+vHH3S+6m7SGO24q1WLw3Fx+T6/mlMAppyOcS6CtcUd
	 S1/N9xeV1cfPA==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260706192150.143921-1-jorijnvdgraaf@catcrafts.net>
References: <20260706192150.143921-1-jorijnvdgraaf@catcrafts.net>
Subject: Re: [PATCH] soundwire: qcom: add SCP address paging support
Message-Id: <178403657091.851500.12269800526705086931.b4-ty@kernel.org>
Date: Tue, 14 Jul 2026 19:12:50 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 06 Jul 2026 21:21:50 +0200, Jorijn van der Graaf wrote:
> The Qualcomm controller driver ignores the paging fields of struct
> sdw_msg. For a paged access (register address >= 0x8000 on a
> paging-capable peripheral, e.g. the SDCA control space at
> 0x40000000+) the core sets BIT(15) in the wire address and splits the
> upper bits into addr_page1/addr_page2, but since the controller never
> programmed the SCP_AddrPage registers the peripheral resolved every
> such command against their reset value: reads and writes were
> silently redirected to addr[14:0] in page 0.
> 
> [...]

Applied, thanks!

[1/1] soundwire: qcom: add SCP address paging support
      commit: 999f80904763fae547c2c9c32bb7dbc31b86ffa1

Best regards,
-- 
~Vinod


