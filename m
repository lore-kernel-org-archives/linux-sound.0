Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2FD36213E;
	Mon,  9 Mar 2026 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039934; cv=none; b=ixuyww0Msl/DQzJoBJ+/+H+OM4GkAzEfvBGuTU0ILa6oyoiQiS0Cqwz5Fximlr2uw72KuHrXJgs25YwTTblNLmqb13qod8/Ig/TNXhZr8OHvW7q5ftDLmwSlSRvVuBwpsngpneFv4DnB5OKmnIahis7py7RfhGY/LlOLfINVmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039934; c=relaxed/simple;
	bh=L3Z29wr/eYd5+5ERT1JKC38BkITfo/zrTyympCj1EVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QR6Ht8a0C5vphn1iqLOOg8vWstffiybkOqgRvqaooKP3S4eLbW8mExwADknVsnU/n1erbkXxvvpY4pfFEhbPtMiO+TAq7m9OxOmoA/sRZPxHStrZT8qRm2tib2Fixo42D7qZGMZt0TRWxOtUW0g5Ibq5l09bTGw3LvBE6Ldw0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bn94/Bmz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bn94/Bmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A480AC4CEF7;
	Mon,  9 Mar 2026 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039934;
	bh=L3Z29wr/eYd5+5ERT1JKC38BkITfo/zrTyympCj1EVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bn94/Bmzk3MebXx23pOtlwX1hneogQw5nKS7Q6E18hIzgJZws99Z6/U+b1E31CQQC
	 XAEDngcKoSZINWEVsWdPTOYUgooze0XPGqcY7UFBFrJXHc/OnZLB6TlTqUMZ42QDkF
	 pnHn30im89xQARjjwAFs4LRw6I1riAPVDfq6e2IpXlnL/xDwRjRHaNanTnMPlFGxhd
	 hB1L5wOFMeCwtTXOpVzs3r1Nci4gfKQSYwQEOsbQMJx5vw+NgmwLcMs2A/eqZhCjvN
	 0sY722DnPkqYgo4ZEOMDXooZ4n+RkzpUq+inhXCflhqXv/uerAvcgli7zKrMB7bRep
	 jEBhocFfz3ECg==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, Cole Leavitt <cole@unwrap.rs>
Cc: pierre-louis.bossart@linux.dev, david.rhodes@cirrus.com, 
 rf@opensource.cirrus.com, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260217233533.4716-1-cole@unwrap.rs>
References: <20260217233533.4716-1-cole@unwrap.rs>
Subject: Re: [PATCH 0/2] soundwire: suppress expected unattach warnings
 during codec reset
Message-Id: <177303993139.65210.11138511504912531971.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:05:31 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Feb 2026 16:35:31 -0700, Cole Leavitt wrote:
> On systems with CS35L56 SoundWire codecs (e.g. Lenovo ThinkPad P16
> Gen3), every boot produces misleading dev_warn() messages:
> 
>   cs35l56 sdw:0:2:01fa:3556:01:0: Slave 2 state check1: UNATTACHED, status was 1
>   cs35l56 sdw:0:2:01fa:3556:01:1: Slave 1 state check1: UNATTACHED, status was 1
> 
> These fire when the CS35L56 driver triggers a system reset after
> firmware download, which physically detaches the codec from the bus.
> This is expected and handled gracefully -- the driver waits for
> re-enumeration and the codec recovers within milliseconds.
> 
> [...]

Applied, thanks!

[1/1] soundwire: bus: demote UNATTACHED state warnings to dev_dbg()
      commit: 2c96956fe764f8224f9ec93b2a9160a578949a7a

Best regards,
-- 
~Vinod


