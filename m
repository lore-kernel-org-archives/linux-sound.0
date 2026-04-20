Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E85257843;
	Mon, 20 Apr 2026 01:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776647654; cv=none; b=nnz+6FDvnWG8A7N0y+n+Zow8Vw1xR87lWBqvDgqE2TyGBis8ZqYtmdhZ+sOdILUuOM8Rk6/2aRWAK/2Npnhn4FXwbrU3p56dPFOrcGlQmUJgDjvnSX6XLvsE483HmHhqXcw8i94JoxR5173+MmEHni3knRgm04JedbL4n8udspA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776647654; c=relaxed/simple;
	bh=fUjxGgWhPEMXwJXCDlJg/8e6o/Bo8ZPhSNIhd5bfYQA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rleVYcV76gZdqjhOdPIyPGtyl8cljh4pXv1FBk5g9t2tcO2bNWTIdoKMpp3wbdVK4o6Lr4oREDFtPzdr0OCLblK+MKGl1zUUxKdCf8Pue/N/igfic91giKYPcNzrWVC2c0HtxK5Aox5K2bqvPqPrYwQyIjfvtCn+p0i52GwMtlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdDD-000000002aX-3qvh;
	Mon, 20 Apr 2026 01:14:08 +0000
Date: Mon, 20 Apr 2026 02:14:04 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 9/9] ARM: dts: mediatek: mt7623n-bananapi-bpi-r2: add HDMI
 audio machine node
Message-ID: <854c8f99582eb0adf13d91dad8ded3faa4e753ec.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>

Instantiate the mediatek,mt2701-hdmi-audio machine on the
BananaPi BPI-R2, binding the AFE HDMI playback path to the
on-chip HDMI transmitter acting as the generic HDMI codec.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
index a37f3fa223c72..139a76764faa0 100644
--- a/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dts
@@ -132,6 +132,13 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0 0x80000000 0 0x80000000>;
 	};
+
+	sound-hdmi {
+		compatible = "mediatek,mt7623n-hdmi-audio",
+			     "mediatek,mt2701-hdmi-audio";
+		mediatek,platform = <&afe>;
+		mediatek,audio-codec = <&hdmi0>;
+	};
 };
 
 &bls {
-- 
2.53.0
