Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513933;
	b=r5gb6JPc+iRIGLVlhtG2vrAHu7bj8CtIvEOdwffpOvKjgL8gsv7b748XvGiZor6XnN0U
	 5/Nzl1N1mJAYOqJYYvU62si4kzVaBy/IqDe/K7sQCGhaH0xqxMzIeJiPa/EFPA1TyHksr
	 4h4qSi9TXrvqrykWcq6sT/1FdUIY+alXVMWqylKHcjxkghhI45QwfQOhfD0X3ycbSPzWL
	 y09XceSJflQNoArxIy4YEwgkx0zSwhzJL21Xg6C9lI/zHq4k2vsUuj6zIrnxLBoP/E08a
	 aauKDV3Ctw+aG+OnzBjARLRKtgIXY5GqCY2c4eQd9vg7D9RZjbVv7t/hXTgGKku/8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513933;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=t14DCwuhCPor22lnTpTCdjIYiXNlEa3PdjbDIU3q1KY=;
	b=1hGe85POs/aTFFkbJy/x/M+nOyCekqXRfbkfJXDPfr/GKr3KUX+gzXXi/tRQQPN3/Jz9
	 75MyLhaz0ohqFQdQxTjjdgvQ2lOG0znMUSJsvs3m/E3I4BRRUsFBs8Y/dFxTOURXyAcRh
	 U5Q9LbrXzhVKnhmA9uuHsDW9MtzwMiGXUL/J+zcUJ1pM9PgfqTz9/E5lhWpLTLhJ5Agse
	 v0FVVOp4IZ/JlHlbcrC5om0zs54i7wj8JfPTGBfIxtqyyAl5c4BlMMjejdkQf5dKfFHbe
	 rmOyj/0aQSwGqFAqyenIqiAiAG7drR2kviVuTXiqh+Vgj8sc6zvct8Sb6VH/1ZBcocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rpw32B3n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25536606A33C;
	Tue, 24 Nov 2026 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rpw32B3n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2CF1F000C4;
	Tue, 24 Nov 2026 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795513932;
	bh=t14DCwuhCPor22lnTpTCdjIYiXNlEa3PdjbDIU3q1KY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Rpw32B3nhUrmh6OhYiBkfgL2bzGFrxfmLvvZ1eaWu/6G/iplMtLIPJzDrkk36cQCJ
	 2CIMAXtI7yBuFaT2vw8xBI2uPQDyNqPSsxguFJCjyxbxdk5ghViDVaKyOUAMH1ZADr
	 JNraCiHKP7EOuWlKVcZ/A8RiidFQ7z9ycoxv7T1hEKMAyXT8IUrmL9qhAPm2on9eQV
	 Mtx8NJ1gHdxMbAYPeaimT8i1KpqHfO5Ih6giACQvbC0VhdlTuPxQ6xFN8IIOi+JLml
	 U5htZgfyA7/OMCPCFYPJ2QD3dL2sX1H18TjlWbX63MTCbwQjkxZJsm2sctotxkbgS6
	 DhfZ3dU8wevSg==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Manuel Ebner <manuelebnerli@mailbox.org>
Cc: linux-sound@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261118190655.1179347-2-manuelebnerli@mailbox.org>
References: <20261118190655.1179347-2-manuelebnerli@mailbox.org>
Subject: Re: [PATCH] docs: soundwire: stream: harmonize diagrams
Message-Id: <179551392947.362684.197376941691926370.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 15:22:09 +0530
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


On Wed, 18 Nov 2026 20:06:52 +0100, Manuel Ebner wrote:
> In example 3 and 4 the slave interfaces are in an equal relation to the
> master interface. Reflect this with equal arrows.
> 
> 

Applied, thanks!

[1/1] docs: soundwire: stream: harmonize diagrams
      commit: 93f9a0afce028b7a8902b8ff2afb8697e3e625d2

Best regards,
-- 
~Vinod


