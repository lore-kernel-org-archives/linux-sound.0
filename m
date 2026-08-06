Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885041A79A;
	Thu,  6 Aug 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005581; cv=none; b=cUtBX3HbgKu6ZL3z/0wfFx+1/Q/n3EE9VIYXHULU2Lqzfa6BGxMqtWKhPXOGf+m+oYdIy0n7jEweIy/V/fVOTQWnaqqvySLlYJUcAgkWFZEsuXINuI+tKkdPh5cxgKn10ZAI3SBK4Ikw+ngUmEXqEdLhsOsk9jAogRQjXLIfcsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005581; c=relaxed/simple;
	bh=8UGtZ9kvbMqgR+sqL+OI2Hwcpm2YGmwOStOe8CR/llg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NMYdNcqDON7mrM+grJBYKdOa9olbEZ5KrtFA8lsTxdOfBwkYH1spZ2msNz1SMGHldt8mTEqYGujir3bUc5V5edCjc1JRfPLfskl6AoUTCt2tl15KYokAKyvmknGxh0/7oQMTAo2pxjHQVV58HJ9kBl23UaNBpAo1VliKzHRysUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hF03x7A7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hF03x7A7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FE41F00A3E;
	Thu,  6 Aug 2026 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005568;
	bh=8zFHv38zv2q/ojptWo+zVAtsh6IAKpMd1zsTAPGyFgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hF03x7A7610n++qYA+0LgGAlPXSmZzEo0Y8UeKuO1eiffUwSu/yDXP2ZGo1uD9bqu
	 QGd+LPXUoNXW5qqLnjufkUafP6oPjXEzwzN6SM4HgZTL/NWrP+AuvvM17veNE5kO28
	 Ac3szcLYhJxqx/XATAe0GrSUsDM193G1pa816qSKr3y+/MhnQOk6JJVJ1DBZwlajam
	 MStm/Y4WK4DrIn0pRoGW2BDhb2GyeAqFPymj/R5tSR6Accj0wXStbhVbqJ6g8vq/OJ
	 BB1fmrnZJSEbTRCoKKs3JwGi0yFbRyjxYWoLGY9kFlUa4yXlSPp2uHVdJ7fhqRaB4B
	 OURWFQJtdaI7A==
From: Vinod Koul <vkoul@kernel.org>
To: Eric Wu <kunjinkao.jp@gmail.com>
Cc: pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com, 
 ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260731123415.34070-1-kunjinkao.jp@gmail.com>
References: <20260731123415.34070-1-kunjinkao.jp@gmail.com>
Subject: Re: [PATCH v2] soundwire: stream: validate slave port properties
Message-Id: <178600556670.593040.8196517712081701814.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 14:09:26 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 31 Jul 2026 20:34:15 +0800, Eric Wu wrote:
> sdw_slave_port_config() validates that a port number is within the
> generic valid range, but does not verify that the Slave exposes the
> port for the requested stream direction. As a result, an in-range but
> unsupported port, or a valid port used in the wrong direction, can be
> accepted.
> 
> Use sdw_get_slave_dpn_prop() to perform the direction-specific lookup
> and reject unsupported ports before storing the runtime configuration.
> 
> [...]

Applied, thanks!

[1/1] soundwire: stream: validate slave port properties
      commit: cd4a294c4b2dcdf86b87128ce4d2023fc016a285

Best regards,
-- 
~Vinod


