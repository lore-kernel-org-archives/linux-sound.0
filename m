Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00961859;
	Fri, 25 Oct 2024 14:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729865369; cv=none; b=Fvbh3jgQS9nD1c9gvDqTBVJGTH88J08j1LwU0uTHfCoxYI2osdOxVtIK3ikIJ+GIxQFLOH+jSxOVmU45OWnX3cYbGgc+w8JaUA97KON4W4XKvcxhnHKmhRMA/gWlYDzZww2pInQFo8Wumj8wIzkQidO8GFKXjkMGooEXpfIKlZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729865369; c=relaxed/simple;
	bh=oaSAdUb8Lt5/ZPApU1GTkGXfYmg7yp1/jlNq8cLB5PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQT/QdCdIoEk6f2IMD7jWb3gY5JPuTactS5mZJskdNPc0oMpOmDTTZSVy/GrqBvYPMweuQn952Pr7uozmYVPm9hpJkOhd0qEQyj1tlvXTaKeOKBIMutx0S6r/TDi3uX/vmJvbRsZFvk//wZEG4YzceWr66Qq+K456scHJHHfCwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbSvb2CC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbSvb2CC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E82C4CEC3;
	Fri, 25 Oct 2024 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729865369;
	bh=oaSAdUb8Lt5/ZPApU1GTkGXfYmg7yp1/jlNq8cLB5PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FbSvb2CC6g2rd8gRuldxfCQKYaIUWvr1gQueoI6XeZ7Fvw2lMwfydR+Ccwdx5Gqo8
	 fiFX8X3DF0ph1IvddlhI6APUgmENXnFhKnUvnGGWrX63MpwzZgT2/G3vCiokLh8GXB
	 0Wm8kwnIxIEyWFQrbcrDRaQKr93ynCcnNMKZosBjJQk3j+InC1EIzS8g6XtZhD5n4G
	 qzhvSylbQh2lSoxbCPlDyRJjkedQ0gQTPoeFvNg5isHObG1mQP0cFQk3c+KJDmcTc/
	 NvNCVHIivNWg65tDojBEPX1hwCF8pg8yhbl9LNUPbcKOU/a52+p6yNiAa4NdKHkFfF
	 8zSvJXkKHIRdg==
Date: Fri, 25 Oct 2024 09:09:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: wangweidong.a@awinic.com
Cc: quic_pkumpatl@quicinc.com, broonie@kernel.org, conor+dt@kernel.org,
	masahiroy@kernel.org, arnd@arndb.de, yijiangtao@awinic.com,
	perex@perex.cz, neil.armstrong@linaro.org, tiwai@suse.com,
	luca.ceresoli@bootlin.com, rf@opensource.cirrus.com,
	linux-sound@vger.kernel.org, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, herve.codina@bootlin.com,
	pierre-louis.bossart@linux.dev
Subject: Re: [PATCH V2 1/2] ASoC: dt-bindings: Add schema for "awinic,aw88081"
Message-ID: <172986536397.2069820.12456852414527695462.robh@kernel.org>
References: <20241024090324.131731-1-wangweidong.a@awinic.com>
 <20241024090324.131731-2-wangweidong.a@awinic.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024090324.131731-2-wangweidong.a@awinic.com>


On Thu, 24 Oct 2024 17:03:23 +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add the awinic,aw88081 property to support the aw88081 chip,
> which is an I2S/TDM input, high efficiency digital
> Smart K audio amplifie.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  Documentation/devicetree/bindings/sound/awinic,aw88395.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

