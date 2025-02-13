Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2EC270EBD
	for <linux-sound@vger.kernel.org>; Thu, 13 Feb 2025 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464214; cv=none; b=tr7ZR9Hasj5chkBvC1hNGEYbLw9OBt+2csOWYzMIeKvNiuqetFj8slogXrqDNqu0QdD76nCjXwUk3ZQq5S42gqWKg7Fq4zJQDoRnJxR3ALbe+QV7W84nE2OPg9FRE5teKczts6Q7DsxROzUv/Sek7OPq7/KnBYDCPFw/2U6uN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464214; c=relaxed/simple;
	bh=0QbZMRcOwuLfrDYgXyExSbOxkQ9Jd79pJbMlXzi1J/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gxGeoJqtFk9MtxSIygRItLgTgdlQWEZS96JcKWPiy/KKNlM3EhR+sXrQnj3lAsu1aeDwY/xjnupl1RjhADCXQsZ4X/w2eGGMz8KlmopZjL2n198itwGzxO2i9hhcf3iJy/QAuctB56f2qT/5oAPk8yX0GMQDFNKeFxs2X6KbWpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BK1te9Zv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BK1te9Zv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E422C4CED1;
	Thu, 13 Feb 2025 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739464213;
	bh=0QbZMRcOwuLfrDYgXyExSbOxkQ9Jd79pJbMlXzi1J/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BK1te9ZvJirEUBtks9HCrDmnNZV6IBjJyYA0lPUg4FnKn7dQMer9i2mLFq4IVacRS
	 gPWcd5ttUtDwAIVLDJn89gi5EfYRGLRNSmUFd5c1eE31AozARhuyt19vpYK4AjmOi3
	 UD+GISdJUDeSbpw+GcYno1tXV15nQNKurtSrj+DOygVJ1tjS9sNRY40grK+Ha+vF0P
	 0ziZq/zVp8xYJIAaCU155/aSF+TnVhXv3xM35wHn0u3uFoarN+SjnABM1Ns5uCwbLi
	 Sat27h5VgFAS6cXDMtFdJtZ7F0kCPpkpoLpP9wrCt0xSvkJNqkMw7RLhZcQuCi1zyU
	 eapC/NpYQ5hLA==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 sanyog.r.kale@intel.com, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20241205034844.2784964-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241205034844.2784964-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH] soundwire: slave: fix an OF node reference leak in
 soundwire slave device
Message-Id: <173946421181.270661.7273667355118557138.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 22:00:11 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 05 Dec 2024 12:48:44 +0900, Joe Hattori wrote:
> When initializing a soundwire slave device, an OF node is stored to the
> device with refcount incremented. However, the refcount is not
> decremented in .release(), thus call of_node_put() in
> sdw_slave_release().
> 
> 

Applied, thanks!

[1/1] soundwire: slave: fix an OF node reference leak in soundwire slave device
      commit: aac2f8363f773ae1f65aab140e06e2084ac6b787

Best regards,
-- 
~Vinod


