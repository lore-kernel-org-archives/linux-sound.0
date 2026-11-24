Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513946;
	b=1lQ1mSNB/m2MWqyAeEYp2IU8h1tDyVUACj+qDoGS6jWo7NR7VdV893YUetLVLrmqplBh
	 pfUlfhFCYcK4io3VlRQFtYA645FWLLBCv9FxmpvdDRUQpumSrdzzMRHStRRP11Fkxqc08
	 /nTSR466xLJZT9mZnzaaKajV38EVV7rg8gCedWFkIU+SWqBhzBbeiWzMjwpwJ3FLVI044
	 SkTUlF7C8LS0a/HFwtYa22DGrzYtm/J3fWjAOjtCD8PnUCUZ1nfugLZCHvXivDaw5I6LW
	 bcmvXmY4F2zjkgRG++rxUr1pfIC120ZPj0U6SLOTujxjMVWxWjFK5DbaEK11jRbE+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513946;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=3gQc90vB9QZyt4nveZxmWV9SB5J6VoCgnuziDCiIcwQ=;
	b=oKRa1G1U+Y3Nb0fUf0MYAMJWRYtu3M9vSEVDRIxYOu+YVbGc9cgMtYYQ+sEjdaEXBrzY
	 3VadgGLQ/Q7TclIyofVvHTg1a93UZ4at9mb4zjjvYq5THTW5OtlEL3A71n02Ct+R+MIkj
	 Z2/Gi8hwZgYVwZSNsiBUOCrBPhIovwpIzA4CmnhN6/5DK6pH6RhPIZ5MviTSlg++vj14K
	 ++PLuzdy1ttOA/ht3mkyXMB7sMkbh7koUjOb4G+4wsDeYShGuucy12hUrAVV3oGbMOuo/
	 PcyC7KQvLThM9rZS3p9ilnMNA7otOmLnEBHFLR1TuxcCuohj/wqG1Wf2UqvsIv2xm8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otexlCIQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C283606A682;
	Tue, 24 Nov 2026 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=otexlCIQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ECA1F000CF;
	Tue, 24 Nov 2026 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513945;
	bh=3gQc90vB9QZyt4nveZxmWV9SB5J6VoCgnuziDCiIcwQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=otexlCIQSZ4zA4vlqt8nzeaZYmjBpQxj2NoKM0VgiJsHlI7Qafk+oTnsjpbkgS7Xq
	 STAVK6/Xo2+owB1ttyDx14YxYfvZcc2th2A+7BjkUYTZAsH6gplxYCsPwwS6FACHPK
	 54Xyshmyd1XC5qDeOkQTH7pW3Hp8LwCuV89hyLCyW6PGSKYNK++rKQBMaIy2JT7lOm
	 Pc16K4iFKAzGvS28weFb9ScYKPl0/QOQsgdftXHmB6IT210ILq5FxPJJ740R9o8PQU
	 eR9rYqfgmriXSTRiz77SuOpXwPk7s6N7ZLwXcxseulyedz12TVz4MeQsvLIh7iyNKD
	 IG0CVUbAvV+qQ==
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] soundwire: qcom: add multi-master support
Message-Id: <179551394126.362684.17003372203937315230.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 15:22:21 +0530
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 23 Nov 2026 17:14:08 +0000, Srinivas Kandagatla wrote:
> This patch series adds support to the multi-master in existing soundwire
> controller driver.
> 
> On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
> up in multi master mode connecting to an SDCA compliant Tambora codec.
> 
> One of the two controllers (tx,rx) act as primary controller in this
> instance its tx which provides clock and control and some data lines and
> other controller instance in this case rx act as dependent controller
> providing extra data lanes to primary controller. This is called multi
> master mode in Qualcomm Soundwire controller.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: soundwire: qcom: describe multi-master
      commit: 7cbbfda56518bfa9360e2f303654db9f01372dc1
[2/3] soundwire: qcom: add multi-master support
      commit: 55207a5b69592e6ec1468baa2524b5a33845ff06
[3/3] soundwire: qcom: program MM_SYNC for multi-master
      commit: b6d625cb2a4b02ed8e9ce9251826d8534fb54296

Best regards,
-- 
~Vinod


