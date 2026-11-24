Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511265;
	b=TbMO8Ih3HlnyJshUznyh+d137Tkm8t061I7hBbxx1jgBXdLua0AHfQMBy4onJDqtKhfJ
	 elGPxZp4KytJKHP3TVd4B5dwEFBPZsKF0Pxh4Wc5WkDQsWOSC6hMV5wrzvqmxN6BAT7nA
	 4sskUqLxYTezHbtCDnf0jkLv7++kkfQXsKWMYOCom5UFnbbW0lV3evZDqlZ5ABvyy2v3W
	 2aHk7BilFVV40fRGTRd2CBjoxnKFyGiyR4VCD5rz8QcdJNLqIHlE8DC22VcsVIcN+cpjE
	 +jGzuSOBGxKH287Oj9boHLrrS2FlBBG/t3vGXmLETMnXzKhNNaZBEzWXmDdUbX1aUzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511265;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yeEqsaROwk1F1+IA2zrAlIhQx6+rnGnMld2/SEXU8x0=;
	b=DINz85LWramLajRjlh/JSmjf9FDkuecFt4Kgk+7rQzFsY0UrAzIfRGM0lP4G4ddZBrdh
	 Sl8rnpF3xNGfxDh3SH7TsdL3VKkZ7ImJEVAkeyo1DML2Dw3ev4TLXNdHk8aLlEvAYUHU9
	 Ldcy3RQfP8dtVv7Fuyia86GQZIG8hH6PkCxGz49Zp5wmJI+JHxxJ9oV9+lk9O+osY5296
	 tgqDSt3fDJCMwDfos8QAjO6SAhF/VeFcwHSwZyhtEdaGFGYzkx04rAzNiCV1QAQNlRSo8
	 34bek1uYOua0mS15t9zIKUw1kTXUCJO4wGiAapmiuW/UacpiJND05yMjbgqgpzWHmHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wzm7EBAx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F1B606A31E;
	Tue, 24 Nov 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wzm7EBAx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2A61F000D2;
	Tue, 24 Nov 2026 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511265;
	bh=yeEqsaROwk1F1+IA2zrAlIhQx6+rnGnMld2/SEXU8x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wzm7EBAx7ESbGdwKlGjx3MTlAHdammph0LHbLCqAZ7VhcvRk3BQHHTihQHJbgKzwR
	 UezsYiC481n2arg+LD2PZZLFp5mP+IQZofqs+Bfw6zU3dccKInFRHn/IH9seIlMVBe
	 R/61d1JbY06gVI/muXjjEfk3wCAUW5HyEZ3+roGSpbei+2lUutE/9jkfbPW4vugjVM
	 REnagmUgdEZ04g8UvqY9iLL8YU5KyuYapAaDdsnHnFoEVAdGxnlx8U3k3eCujnsH8O
	 w70327++JOUMjcBYJrUTQr3RysgEK57DSKbm01Jd2gn7F0KWy07cb3p0hr1c7JvnIZ
	 T9Gl0jXh7v6KQ==
Date: Tue, 24 Nov 2026 14:37:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soundwire: mipi_disco: Put fwnode on property array
 read errors
Message-ID: <awVT3MHdgD3MAxt3@parshuram>
References: <20261112060943.1916-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112060943.1916-1-laixiangwu@cmss.chinamobile.com>

On 12-11-26, 14:09, Xiangwu Lai wrote:
> sdw_master_read_prop() and sdw_slave_read_dpn() take a fwnode
> reference with device_get_named_child_node() and already release it
> on the -ENOMEM and success paths.  However, the error paths added
> for the property array reads jump straight out without dropping the
> reference, leaking it on every failed read.  The lane-list support
> in sdw_slave_read_dpn() is even missing the put on its -ENOMEM path,
> unlike the other array allocations in the same function.
> 
> Release the reference on those error paths as well, matching the
> existing -ENOMEM handling in the same functions.

This fails for me on on the current code - sdw/next. Please rebase

-- 
~Vinod
